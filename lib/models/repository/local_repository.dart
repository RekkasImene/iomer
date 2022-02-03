//Vue vers bdd et bdd  vers vue, mode hors ligne
import 'dart:developer';
import 'package:drift/drift.dart';
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

  Future<List<Reservation>> getAllReservation() async {
    return await database.reservationDao.getAllReservations();
  }

  Future<void> modifyMatricule(Matricule matricule) async {
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

  Future insertDocument(int idOt, Uint8List attachement) async{
    database.documentDao.insertDocument(
        DocumentsCompanion(IDOT: Value(idOt),ATTACHEMENT: Value(attachement)));
  }
  Future<List<Ot>> findOtsBy(int idEquipement) async {
    return database.otDao.findOtsBy(idEquipement);
  }

  Future<Equipement> findEquipementsBy(String codeEquipement) async {
    return database.equipementDao.findEquipementBy(codeEquipement);
  }

  Future<List<Matricule>> findMatriculesChecked () async{
    return findMatriculesChecked();
  }
  Future<Article> findArticleBy(String codeArticle) async{
    return database.articleDao.findArticleBy(codeArticle);
  }
  Future <List<Reservation>> findReservationBy (int idOt) async{
    return database.reservationDao.findReservationBy(idOt);
  }
  Future insertReservation (Article article, int idOt , int quantity) async{
    List<Reservation> reservations = await database.reservationDao.sortTable();
    int newId = reservations.first.IDPIECE;
    database.reservationDao.insertReservation(
        Reservation(
            IDPIECE: newId++,
            LIBELLEARTICLE: article.LIBELLEARTICLE,
            QTEARTICLE: quantity,
            IDARTICLE: article.IDARTICLE,
            IDOT: idOt));
  }
  Future modifyReservation (Reservation reservation) async{
    database.reservationDao.modifieReservation(reservation);
  }
  Future <List<Tache>> findTachesBy (int idOt) async{
    return database.tacheDao.findTachesBy(idOt);
  }
  Future modifyOt(Ot ot) async{
    database.otDao.modifieOt(ot);
  }
  Future modifyTache(int idOt) async{
    database.tacheDao.findTachesBy(idOt);
  }
}