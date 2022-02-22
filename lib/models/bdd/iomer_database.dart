import 'package:iomer/models/bdd/config.dart';
import 'package:iomer/models/bdd/origine.dart';
import 'package:iomer/models/bdd/ot.dart';
import 'package:iomer/models/bdd/reservation.dart';
import 'package:iomer/models/bdd/site.dart';
import 'package:iomer/models/bdd/tache.dart';
import 'package:drift/drift.dart';

import 'article.dart';
import 'categorie.dart';
import 'document.dart';
import 'equipement.dart';
import 'matricule.dart';

export 'database/shared.dart';

part 'iomer_database.g.dart';


@DriftDatabase(tables: [Articles,Categories,Documents,Equipements,Matricules,
  Origines,Ots,Reservations,Sites,Taches,Configs],
    daos: [ArticleDao,CategorieDao,EquipementDao,MatriculeDao,OrigineDao,OtDao,
      ReservationDao,SiteDao,TacheDao,ConfigDao,DocumentDao]
)

class IomerDatabase extends _$IomerDatabase {
  IomerDatabase(QueryExecutor e) : super(e);

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