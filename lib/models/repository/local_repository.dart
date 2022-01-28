//Vue vers bdd et bdd  vers vue, mode hors ligne
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import '../bdd/iomer_database.dart';

@Environment(Env.prod)
@singleton
@injectable
class LocalRepository {
  final IomerDatabase database;
  LocalRepository(this.database);

  //GetAll Methods from db.sqlite database
  Future<List<Matricule>> getAllMatricule() {
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<Ot>> getAllOt() {
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

  Future<List<Site>> getAllSite() {
    return database.siteDao.getAllSites();
  }

  Future<List<Reservation>> getAllReservation() {
    return database.reservationDao.getAllReservations();
  }

  void modifieOt(Ot ot ){
      
    database.otDao.modifieOt(ot.copyWith());


  }

  void saveData(Site site, Config config) {
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
  }
//vue vers bdd
  void addNewOt( int idEquipement, int idOrigine, int idCategorie, String libelleOt) {

    int newIdOT =0;
    Future<List<Ot>> lastdata = database.otDao.sortTable();

     lastdata.then((value) {

      newIdOT = value.first.IDOT;
      newIdOT++;

     final DateTime now = DateTime.now();
     String beforeTime = DateFormat.Hm().format(now);

    Ot newOt = Ot(IDOT: newIdOT, CODEOT: "null", LIBELLEOT: libelleOt, 
    IDORIGINE : idOrigine, IDEQUIPEMENT : idEquipement, IDCATEGORIE: idCategorie, DTOPENOT : DateTime.parse(beforeTime));
    

    log("affiches moi mon new ot"+newOt.toString());
    database.otDao.insertOt(newOt);

    }).catchError((error) {
      log(error);
    });

  }

void addNewDocument( int idOt, int idAttachement, String attachement) {

}

}