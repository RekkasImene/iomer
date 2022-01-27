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
  final IomerDatabase database;
  final LocalRepository localRepository;
  InRepository(this.database,this.localRepository);

  late Future<List<Site>> futureSites;
  late Future<List<Origine>> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late Future<List<OtData>> futureOTs;
  late Future<List<Categorie>> futureCategories;
  late Future<List<Reservation>> futureReservations;
  late Future<List<Article>> futureArticles;
  late Future<List<Equipement>> futureEquipements;
  late Future<List<Tache>> futureTaches;
  late Future<List<ConfigData>> futureConfig;


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

  void updateMatricules(int idOrigine) {
    futureMatricules = fetchMatricules(idOrigine);
    futureMatricules.then((value) {
      value.forEach((e) {
        database.matriculeDao.insertMatricule(e);
        log("table matricule insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  void updateOTs(int idSite, int idOrigine) {
    futureOTs = fetchOTs(idSite, idOrigine);
    futureOTs.then((value) {
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
    futureCategories.then((value) {
      value.forEach((e) {
        database.categorieDao.insertCategorie(e);
      });
    }).catchError((error) {
      log(error);
    });
  }

  void updateReservation(int idOt) {
    futureReservations = fetchReservations(idOt);
    futureReservations.then((value) {
      value.forEach((e) {
        database.reservationDao.insertReservation(e);
        log("table reservation insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  void updateArticles(String codeArticle) {
    futureArticles = fetchArticles(codeArticle);
    futureArticles.then((value) {
      value.forEach((e) {
        database.articleDao.insertArticle(e);
        log("table articles insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  void updateEquipements(int idSite) {
    futureEquipements = fetchEquipements(idSite);
    futureEquipements.then((value) {
      value.forEach((e) {
        database.equipementDao.insertEquipement(e);
        log("table équipement insérée");
      });
    }).catchError((error) {
      log(error);
    });
  }

  void updateTaches(int idOT) {
    futureTaches = fetchOTTaches(idOT);
    futureTaches.then((value) {
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

  Future<List<ConfigData>> getConfig(int idsite, String pocket) {
    return fetchConfigs(idsite, pocket);
  }

  @override
  void InsertSite(Site site) {
    database.siteDao.insertSite(site);
  }

  //Filed database
  void pushDB(int idSite, String codePocket) {
    //push equipement & categories
    updateCategories(idSite)
        .then((value) => updateEquipements(idSite).then((value) {
              //push matricule & ot
              futureConfigs = fetchConfigs(idSite, codePocket);
              futureConfigs.then((value) {
                int idOrigine = value.first.IDORIGINE!;
                updateMatricules(idOrigine)
                    .then((value) => updateOTs(idSite, idOrigine));
              }).catchError((error) {
                log(error);
              });
            }).then((value) {
              //push tache & OtArticle(Reservation)
              localRepository.getAllOt().then((value) {
                value.forEach((e) {
                  updateTaches(e.IDOT)
                      .then((value) => updateReservation(e.IDOT).then((value) {
                            //push articles
                            localRepository.getAllReservation().then((value) {
                              value.forEach((e) {
                                updateArticles(e.CODEARTICLE!);
                              });
                            }).catchError((error) {
                              log(error);
                            });
                          }));
                });
              }).catchError((error) {
                log(error);
              });
            }));
  }

  Future<List<ConfigData>> getConfig(int idsite, String pocket) {
    return fetchConfigs(idsite, pocket);
  }
}
