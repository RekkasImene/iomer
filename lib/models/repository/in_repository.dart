//webservice vers bdd

import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';
import 'local_repository.dart';

abstract class InRepositoryAbs {
  Future<List<Site>> getAllSite();

  void InsertSite(Site site);
}

@Environment(Env.prod)
@singleton
@injectable
class InRepository extends InRepositoryAbs {
  late Future<List<Site>> futureSite;
  final IomerDatabase database;
  final LocalRepository localRepository;
  late bool flag = false;

  InRepository(this.database, this.localRepository);

  late Future<List<Site>> futureSites;
  late Future<List<Origine>> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late Future<List<Ot>> futureOTs;
  late Future<List<Categorie>> futureCategories;
  late Future<List<Reservation>> futureReservations;
  late Future<List<Article>> futureArticles;
  late Future<List<Equipement>> futureEquipements;
  late Future<List<Tache>> futureTaches;
  late Future<List<Config>> futureConfigs;

  void updateOrigines(int idSite) {
    futureOrigines = fetchOrigines(idSite);

    futureOrigines.then((value) {
      value.forEach((e) {
        database.origineDao.insertOrigine(e);
        log("table origine insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateMatricules(int idOrigine) {
    futureMatricules = fetchMatricules(idOrigine);
    return futureMatricules.then((value) {
      value.forEach((e) {
        database.matriculeDao.insertMatricule(e);
        log("table matricule insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateOTs(int idSite, int idOrigine) {
    futureOTs = fetchOTs(idSite, idOrigine);
    return futureOTs.then((value) {
      value.forEach((e) {
        database.otDao.insertOt(e);
        log("table ot insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateCategories(int idSite) {
    futureCategories = fetchCategories(idSite);
    return futureCategories.then((value) {
      value.forEach((e) {
        database.categorieDao.insertCategorie(e);
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateReservation(int idOt) {
    futureReservations = fetchReservations(idOt);
    return futureReservations.then((value) {
      value.forEach((e) {
        database.reservationDao.insertReservation(e);
        log("table reservation insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateArticles(String codeArticle) async {
    futureArticles = fetchArticles(codeArticle);
    return futureArticles.then((value) {
      value.forEach((e) {
        database.articleDao.insertArticle(e);
        log("table articles insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateEquipements(int idSite) {
    futureEquipements = fetchEquipements(idSite);
    return futureEquipements.then((value) {
      value.forEach((e) {
        database.equipementDao.insertEquipement(e);
        log("table équipement insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<void> updateTaches(int idOT) {
    futureTaches = fetchOTTaches(idOT);
    return futureTaches.then((value) {
      value.forEach((e) {
        database.tacheDao.insertTache(e);
        log("table tache insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  @override
  Future<List<Site>> getAllSite() {
    return fetchSites();
  }

  @override
  void InsertSite(Site site) {
    database.siteDao.insertSite(site);
  }

  //Filed database
  Future<void> pushDB(int idSite, String codePocket) async {
    //push matricule & ot
    futureConfigs = fetchConfigs(idSite, codePocket);
    futureConfigs.then((value) {
      int idOrigine = value.first.IDORIGINE!;
      updateMatricules(idOrigine)
          .then((value) => updateOTs(idSite, idOrigine).then((value) {
                //push equipement & categories
                updateCategories(idSite)
                    .then((value) => updateEquipements(idSite).then((value) {
                          //push tache & OtArticle(Reservation)
                          localRepository.getAllOt().then((value) {
                            value.forEach((e) {
                              updateTaches(e.IDOT).then((value) =>
                                  updateReservation(e.IDOT).then((value) {
                                    //push articles
                                    localRepository
                                        .getAllReservation()
                                        .then((value) {
                                      value.forEach((e) async {
                                        await updateArticles(e.CODEARTICLE!);
                                      });
                                      flag = true;
                                    }).catchError((error) {
                                      log(error);
                                    });
                                  }));
                            });
                          }).catchError((error) {
                            log(error);
                          });
                        }));
              }));
    });
  }

  bool getFlag() {
    return this.flag;
  }
}
