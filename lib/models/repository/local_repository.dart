//Vue vers bdd et bdd  vers vue, mode hors ligne
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import '../bdd/iomer_database.dart';

@Environment(Env.prod)
@singleton
@injectable
class LocalRepository {
  final IomerDatabase database;
  LocalRepository(this.database);

  //for closing database
  Future close() async {
    database.close();
  }

  //GetAll Methods from db.sqlite database
  Future<List<Matricule>> getAllMatricule() async{
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<OtData>> getAllOt() async{
    return database.otDao.getAllOts();
  }
  Future<List<Article>> getAllArticle() async{
    return database.articleDao.getAllArticles();
  }

  Future<List<Categorie>> getAllCategory() async{
    return database.categorieDao.getAllCategories();
  }

  Future<List<Equipement>> getAllEquipement() async{
    return database.equipementDao.getAllEquipements();
  }

  Future<List<Origine>> getAllOrigine() async{
    return database.origineDao.getAllOrigine();
  }

  Future<List<Tache>> getAllTache() async{
    return database.tacheDao.getAllTaches();
  }

  Future<List<Site>> getAllSite() async{
    return database.siteDao.getAllSites();
  }

  Future<List<Reservation>> getAllReservation() async{
    return database.reservationDao.getAllReservations();
  }

  //save id from Blooc to DB
  Future saveData(Site site, ConfigData config, Origine origine) async{
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
    database.origineDao.insertOrigine(origine);

  }

  //Create an unexistant ot (new one)
  void addNewOt( int idEquipement, int idOrigine, int idCategorie, String libelleOt) {

    int newIdOT =0;
    Future<List<OtData>> lastdata = database.otDao.sortTable();

     lastdata.then((value) {

      newIdOT = value.first.IDOT;
      newIdOT++;

      OtData newOt = OtData(
          IDOT: newIdOT,
          CODEOT: "null",
          LIBELLEOT: libelleOt,
          IDORIGINE: idOrigine,
          IDEQUIPEMENT: idEquipement,
          IDCATEGORIE: idCategorie);

    database.otDao.insertOt(newOt);

    }).catchError((error) {
      log(error);
    });

  }

  Future<Document> addNewDocument(Document photo) async{
    await database.documentDao.insertDocument(photo);
    return photo;
    }


}