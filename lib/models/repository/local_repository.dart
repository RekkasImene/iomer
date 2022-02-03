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

  //for closing database
  Future close() async {
    database.close();
  }

  //GetAll Methods from db.sqlite database
  Future<List<Matricule>> getAllMatricule() async{
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<Ot>> getAllOt() async {
    return await database.otDao.getAllOts();
  }
  Future<List<Article>> getAllArticle() async {
    return await database.articleDao.getAllArticles();
  }

  Future<List<Categorie>> getAllCategory() async {
    return await database.categorieDao.getAllCategories();
  }

  Future<List<Equipement>> getAllEquipement() async {
    return await database.equipementDao.getAllEquipements();
  }

  Future<List<Origine>> getAllOrigine() async {
    return await database.origineDao.getAllOrigine();
  }

  Future<List<Tache>> getAllTache() async {
    return await database.tacheDao.getAllTaches();
  }

  Future<List<Site>> getAllSite() async {
    return database.siteDao.getAllSites();
  }

  Future<List<Reservation>> getAllReservation() async{
    return await database.reservationDao.getAllReservations();
  }

  Future<void> ModifieMatricule(Matricule matricule) async {
    await database.matriculeDao.modifieMatricule(matricule);
  }

  void ModifieOt(Ot ot) {
    database.otDao.modifieOt(ot);
  }

  //save id from Blooc to DB
  void saveData(Site site, Config config, Origine origine) async{
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
    database.origineDao.insertOrigine(origine);

  }

  Future<void> addNewOt( int idEquipement, int idOrigine, int idCategorie, String libelleOt) async {

    int newIdOT =0;
    List<Ot> lastdata = await database.otDao.sortTable();


      newIdOT = lastdata.first.IDOT;
      newIdOT++;
      final DateTime now = DateTime.now();
      String beforeTime = DateFormat.Hm().format(now);

    Ot newOt = Ot(IDOT: newIdOT, CODEOT: "null", LIBELLEOT: libelleOt,
    IDORIGINE : idOrigine, IDEQUIPEMENT : idEquipement, IDCATEGORIE: idCategorie, DTOPENOT : DateTime.parse(beforeTime));


      await database.otDao.insertOt(newOt);

  }

  Future<Document> addNewDocument(Document photo) async{
    await database.documentDao.insertDocument(photo);
    return photo;
    }


}