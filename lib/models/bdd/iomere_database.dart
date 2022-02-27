import 'package:drift/drift.dart';
import 'package:iomere/models/bdd/config.dart';
import 'package:iomere/models/bdd/origine.dart';
import 'package:iomere/models/bdd/ot.dart';
import 'package:iomere/models/bdd/reservation.dart';
import 'package:iomere/models/bdd/site.dart';
import 'package:iomere/models/bdd/tache.dart';

import 'article.dart';
import 'categorie.dart';
import 'document.dart';
import 'equipement.dart';
import 'matricule.dart';

export 'database/shared.dart';

part 'iomere_database.g.dart';


@DriftDatabase(tables: [Articles,Categories,Documents,Equipements,Matricules,
  Origines,Ots,Reservations,Sites,Taches,Configs],
    daos: [ArticleDao,CategorieDao,EquipementDao,MatriculeDao,OrigineDao,OtDao,
      ReservationDao,SiteDao,TacheDao,ConfigDao,DocumentDao]
)

class IomereDatabase extends _$IomereDatabase {
  IomereDatabase(QueryExecutor e) : super(e);

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