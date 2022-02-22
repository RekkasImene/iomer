
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/article.dart';
import 'package:iomer/models/bdd/categorie.dart';
import 'package:iomer/models/bdd/equipement.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/matricule.dart';
import 'package:iomer/models/bdd/origine.dart';
import 'package:iomer/models/bdd/ot.dart';
import 'package:iomer/models/bdd/reservation.dart';
import 'package:iomer/models/bdd/site.dart';
import 'package:iomer/models/bdd/tache.dart';
import 'package:iomer/webService/services.dart';
import 'local_repository.dart';

/// [InRepository] recupère les données du webService et les stocke dans la base de donnée locale via les DAO
/// Appelle les méthodes de [Services]


@Environment(Env.prod)
@singleton
@injectable
class InRepository {
  late Future<List<Site>> futureSite;
  final IomerDatabase database;
  final LocalRepository localRepository;
  final Services services;

  /// flag : Donnée observable permettant de déclencher la navigation entre les vues Home et Matricule
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

/// Récupère les Origines du WebService ($url/GetOrigines/$idSite) et les insère dans la table [Origines]
  void updateOrigines(int idSite) async {
    try {
      var origines = await services.fetchOrigines(idSite);
      origines.forEach((e) {
        database.origineDao.insertOrigine(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Matricules du WebService ($url/GetMatricules/$idOrigine) et les insère dans la table [Matricules]
  Future<void> updateMatricules(int idOrigine) async {
    try {
      var martricules = await services.fetchMatricules(idOrigine);
      martricules.forEach((e) {
        database.matriculeDao.insertMatricule(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Ots du WebService ($url/GetOts/$idSite/$idOrigine) et les insère dans la table [Ots]
  Future<void> updateOTs(int idSite, int idOrigine) async {
    try {
      var ots = await services.fetchOTs(idSite, idOrigine);
      ots.forEach((e) {
        database.otDao.insertOt(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Categories du WebService ($url/GetCategories/$idSite) et les insère dans la table [Categories]
  Future<void> updateCategories(int idSite) async {
    try {
      var categories = await services.fetchCategories(idSite);
      categories.forEach((e) {
        database.categorieDao.insertCategorie(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Reservation du WebService ($url/GETOT_ARTICLES/$idOt) et les insère dans la table [Reservations]
  Future<void> updateReservation(int idOt) async {
    try {
      var reservations = await services.fetchReservations(idOt);
      reservations.forEach((e) {
        database.reservationDao.insertReservation(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Articles du WebService ($url/GETARTICLE/$codeArticle) et les insère dans la table [Articles]
  Future<void> updateArticles(String idArticle) async{
    try {
      var articles = await services.fetchArticles(idArticle);
      articles.forEach((e) {
        database.articleDao.insertArticle(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Equipements du WebService ($url/GetEquipements/$idSite) et les insère dans la table [Equipements]
  Future<void> updateEquipements(int idSite) async {
    try {
      var equipements = await services.fetchEquipements(idSite);
      equipements.forEach((e) {
        database.equipementDao.insertEquipement(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère les Taches du WebService ($url/GETOT_TACHES/$idOT) et les insère dans la table [Taches]
  Future<void> updateTaches(int idOT) async {
    try {
      var taches = await services.fetchOTTaches(idOT);
      taches.forEach((e)  {
        database.tacheDao.insertTache(e);
      });
    } on Exception catch (e) {
      log(e.toString());
    }
  }
  /// Récupère tous les [Site] du WebService ($url/GetSites)
  @override
  Future<List<Site>> getAllSite() async {
    List<Site> sites = await services.fetchSites();
    return sites;
  }
/// Insèrer le site séléctionné dans la table [Sites]
  @override
  Future<void> InsertSite(Site site) async {
    database.siteDao.insertSite(site);
  }

  ///Remplir la base de donnée ( appelle les fonctions d'insértion dans les tables de la bdd )
  Future<void> pushDB(int idSite, String codePocket) async {

    //Récupérer la config ( choix du site + code Pocket sur la première vue Home )
    futureConfigs = await services.fetchConfigs(idSite, codePocket);
    int idOrigine = futureConfigs.first.IDORIGINE!;

    await updateMatricules(idOrigine);
    await updateOTs(idSite, idOrigine);
    await updateCategories(idSite);
    await updateEquipements(idSite);


    sleep(const Duration(seconds:1));
    var ots = await localRepository.getAllOt();
    for(int i=0;i<ots.length;i++) {
      await updateReservation(ots[i].IDOT);
      await updateTaches(ots[i].IDOT);
    }

    log("Pause... 2 ");
    sleep(const Duration(seconds:1));

   /* var reservations = await localRepository.getAllReservation();
    for(int i=0;i<reservations.length;i++) {
      await updateArticles(reservations[i].CODEARTICLE.toString());
    }*/

    services.client.close();
    flag.add(true);
  }

///Supprimer toutes les tables de la base de donnée
  Future<void> deleteAllDatabase() async {
    database.deleteEverything();
  }
}
