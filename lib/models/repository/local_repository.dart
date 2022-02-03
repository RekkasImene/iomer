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

  Future<List<Ot>> getAllOt() async {
    return await database.otDao.getAllOts();
  }

  Future <Ot> getOt() async{
    return Ot(IDOT: 1, CODEOT: "CODEOT", LIBELLEOT: "LIBELLEOT");
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

  void saveData(Site site, Config config) {
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
  }

  Future<void> addNewOt( int idEquipement, int idOrigine, int idCategorie, String libelleOt) async {

    int newIdOT =0;
    List<Ot> lastdata = await database.otDao.sortTable();


     final DateTime now = DateTime.now();
     String beforeTime = DateFormat.Hm().format(now);

    Ot newOt = Ot(IDOT: newIdOT, CODEOT: "null", LIBELLEOT: libelleOt, 
    IDORIGINE : idOrigine, IDEQUIPEMENT : idEquipement, IDCATEGORIE: idCategorie, DTOPENOT : DateTime.parse(beforeTime));
    

      await database.otDao.insertOt(newOt);

  }

void addNewDocument( int idOt, int idAttachement, String attachement) {

}

}