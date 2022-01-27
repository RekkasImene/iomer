import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/config.dart';
import 'package:iomer/models/bdd/origine.dart';
import 'package:iomer/models/bdd/ot.dart';
import 'package:iomer/models/bdd/reservation.dart';
import 'package:iomer/models/bdd/site.dart';
import 'package:iomer/models/bdd/tache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

import 'article.dart';
import 'categorie.dart';
import 'document.dart';
import 'equipement.dart';
import 'matricule.dart';

part 'iomer_database.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Articles,Categories,Documents,Equipements,Matricules,
  Origines,Ot,Reservations,Sites,Taches,Config],
    daos: [ArticleDao,CategorieDao,EquipementDao,MatriculeDao,OrigineDao,OtDao,
      ReservationDao,SiteDao,TacheDao,ConfigDao]
)

@Environment(Env.prod)
@singleton
@injectable
class IomerDatabase extends _$IomerDatabase {
  IomerDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}