//Vue vers bdd et bdd  vers vue, mode hors ligne

import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/ot.dart';

import '../bdd/iomer_database.dart';

@Environment(Env.prod)
@singleton
@injectable
class LocalRepository {
  final IomerDatabase database;
  LocalRepository(this.database);
  
  
  Future<List<Matricule>> getAllMatricule() {
    log(database.matriculeDao.getAllMatricules().toString());
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<OtData>> getAllOt() {
    return database.otDao.getAllOts();
  }
  Future<List<Article>> getAllArticle() {
    return database.articleDao.getAllArticles();
  }

  Future<List<Categorie>> getAllCategory() {
    return database.categorieDao.getAllCategories();
  }

  Future<List<Equipement>> getAllEquipement() {
    return database.equipementDao.getAllEquipements();
  }

  Future<List<Origine>> getAllOrigine() {
    return database.origineDao.getAllOrigine();
  }

  Future<List<Tache>> getAllTache() {
    return database.tacheDao.getAllTaches();
  }

  Future<List<Site>> getAllSite(){
    return database.siteDao.getAllSites();
  }

  Future<List<Reservation>> getAllReservation() {
    return database.reservationDao.getAllReservations();
  }

  void saveData(Site site, ConfigData config) {
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
  }

  void addNewOt( int idEquipement, int idOrigine, int idCategorie, String libelleOt) {

    int newIdOT =0;
    Future<List<OtData>> lastdata = database.otDao.sortTable();

    lastdata.then((value) {
      log("msgg " + value.toString());

      newIdOT = value.first.IDOT;
      newIdOT++;
      log("idOt incréemente" + newIdOT.toString());

      OtData newOt = OtData(
          IDOT: newIdOT,
          CODEOT: "null",
          LIBELLEOT: libelleOt,
          IDORIGINE: idOrigine,
          IDEQUIPEMENT: idEquipement,
          IDCATEGORIE: idCategorie);

      log("affiches moi mon new ot" + newOt.toString());
      database.otDao.insertOt(newOt);

    log("Insert new ot "+newOt.toString());
    }).catchError((error) {
      log(error);
    });
  }
}