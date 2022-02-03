//Vue vers bdd et bdd  vers vue, mode hors ligne
import 'dart:async';
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

  StreamController<bool> flagotliste = StreamController<bool>.broadcast();

  //GetAll Methods from db.sqlite database
  Future<List<Matricule>> getAllMatricule() {
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

  Future<List<Reservation>> getAllReservation() async {
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
    Future<List<Ot>> lastdata = database.otDao.sortTable();

    lastdata.then((value) async {
      log("msgg "+value.toString());

      newIdOT = value.first.IDOT;
      newIdOT++;
      log("idOt incréemente" +newIdOT.toString());

      //final DateTime now = DateTime.now();
      //String beforeTime = DateFormat.Hm().format(now);

      Ot newOt = Ot(IDOT: newIdOT, CODEOT: "null", LIBELLEOT: libelleOt,
          IDORIGINE : idOrigine, IDEQUIPEMENT : idEquipement, IDCATEGORIE: idCategorie);
      // DTOPENOT : DateTime.parse(beforeTime));

      await database.otDao.insertOt(newOt); log("Insert new ot "+newOt.toString());
      print("-------------------- Fin insert OT.. -------------------------------");
    }).catchError((error) {
      log(error);
    });

  }

  void addNewDocument(int idOt, int idAttachement, String attachement) {}
}
