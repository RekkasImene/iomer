//webservice vers bdd

import 'dart:async';
import 'dart:developer';
import 'dart:io';
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
  final Services services;

  StreamController<bool> flag = StreamController<bool>.broadcast();

  InRepository(this.database, this.localRepository, this.services);

  late Future<List<Site>> futureSites;
  late List<Origine> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late List<Ot> futureOTs;
  late Future<List<Categorie>> futureCategories;
  late Future<List<Reservation>> futureReservations;
  late Future<List<Article>> futureArticles;
  late Future<List<Equipement>> futureEquipements;
  late Future<List<Tache>> futureTaches;
  late List<Config> futureConfigs;

  void updateOrigines(int idSite) async {
    try {
      var origines = await services.fetchOrigines(idSite);
      origines.forEach((e) {
        database.origineDao.insertOrigine(e);
        log("table origine insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateMatricules(int idOrigine) async {
    try {
      var martricules = await services.fetchMatricules(idOrigine);
      martricules.forEach((e) {
        database.matriculeDao.insertMatricule(e);
        log("table matricule insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateOTs(int idSite, int idOrigine) async {
    try {
      var ots = await services.fetchOTs(idSite, idOrigine);
      ots.forEach((e) {
        database.otDao.insertOt(e);
        log("table ot insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateCategories(int idSite) async {
    try {
      var categories = await services.fetchCategories(idSite);
      categories.forEach((e) {
        database.categorieDao.insertCategorie(e);
        log("table categories insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateReservation(int idOt) async {
    try {
      var reservations = await services.fetchReservations(idOt);
      reservations.forEach((e) {
        database.reservationDao.insertReservation(e);
        log("table reservation insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateArticles(String idArticle) async {
    try {
      var articles = await services.fetchArticles(idArticle);
      articles.forEach((e) {
        database.articleDao.insertArticle(e);
        log("table articles insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateEquipements(int idSite) async {
    try {
      var equipements = await services.fetchEquipements(idSite);
      equipements.forEach((e) {
        database.equipementDao.insertEquipement(e);
        log("table équipement insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateTaches(int idOT) async {
    try {
      var taches = await services.fetchOTTaches(idOT);
      taches.forEach((e) {
        database.tacheDao.insertTache(e);
        log("table tache insérée");
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<Site>> getAllSite() async {
    List<Site> sites = await services.fetchSites();
    return sites;
  }

  @override
  Future<void> InsertSite(Site site) async {
    database.siteDao.insertSite(site);
  }

  //Filed database
  Future<void> pushDB(int idSite, String codePocket) async {
    //Push matricule & ot
    futureConfigs = await services.fetchConfigs(idSite, codePocket);
    int idOrigine = futureConfigs.first.IDORIGINE!;

    await updateMatricules(idOrigine);
    await updateOTs(idSite, idOrigine);
    await updateCategories(idSite);
    await updateEquipements(idSite);

    //push tache & OtArticle(Reservation)
    log("Pause... 1 ");
    sleep(const Duration(seconds: 1));

    var ots = await localRepository.getAllOt();
    for (int i = 0; i < ots.length; i++) {
      log("ID ot : " + ots[i].IDOT.toString());
      await updateReservation(ots[i].IDOT);
      await updateTaches(ots[i].IDOT);
    }

    log("Pause... 2 ");
    sleep(const Duration(seconds: 1));

    var reservations = await localRepository.getAllReservation();
    for (int i = 0; i < reservations.length; i++) {
      List<String> list = reservations[i].LIBELLEARTICLE.split(" ");
      await updateArticles(list[list.length - 1]);
    }

    services.client.close();
    flag.add(true);
  }

  Future<void> deleteAllDatabase() async {
    database.deleteEverything();
  }
}
