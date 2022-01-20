//webservice vers bdd

import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';

abstract class InRepositoryAbs {
  Future<List<Site>> getAllSite();
}

@Environment(Env.prod)
@singleton
@injectable
class InRepository {
  final IomerDatabase database;

  InRepository(this.database);

  late Future<List<Site>> futureSite;
  late Future<List<Categorie>> futureCategorie;
  late Future<List<Origine>> futureOrigine;

  void updateSite() {
    futureSite = fetchSite();
    futureSite.then((value) {
      value.forEach((e) {
        database.siteDao.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE: e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,
        ));
      });
    }).catchError((error) {
      log(error);
    });

    void updateCategories(int id_site) {
      futureCategorie = fetchCategories(id_site);
      futureCategorie.then((value) {
        value.forEach((categorie) {
          log("idCategorie:" + categorie.IDCATEGORIE.toString());
          database.categorieDao.insertCategorie(CategoriesCompanion.insert(
              CODECATEGORIE: categorie.CODECATEGORIE,
              LIBELLECATEGORIE: categorie.LIBELLECATEGORIE,
              IDSITE: Value(categorie.IDSITE),
              IDCATORIGINAL: Value(categorie.IDCATEGORIE)));
        });
      });
    }

    //bryan est passé par la
    void updateOrigines(int id_site) {
      futureOrigine = fetchOrigines(id_site);
      futureOrigine.then((value) {
        value.forEach((origine) {
          log("idOrigine:" + origine.IDORIGINE.toString());
          database.origineDao.insertOrigine(OriginesCompanion.insert(
              CODEORIGINE: origine.CODEORIGINE,
              LIBELLEORIGINE: origine.LIBELLEORIGINE,
              IDSITE: Value(origine.IDSITE),
              IDORIGINEORIGINAL: Value(origine.IDORIGINE)));
        });
      });
    }
  }

  @override
  Future<List<Site>> getAllSite() {
    return fetchSite();
  }
}
