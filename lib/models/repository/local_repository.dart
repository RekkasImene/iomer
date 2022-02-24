//Vue vers bdd et bdd  vers vue, mode hors ligne
import 'dart:async';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';

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

  Ot otSaved = Ot(IDOT: 0, CODEOT: "CODEOT", LIBELLEOT: "LIBELLEOT");

  //GetAll Methods from db.sqlite database
  Future<List<Matricule>> getAllMatricule() async {
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<Ot>> getOtsCloded() async {
    return await database.otDao.getOtsClose();
  }

  Future<List<Ot>> getAllOt() async {
    return await database.otDao.getAllOt();
  }

  void saveOt(Ot ot) async {
    otSaved = ot;
  }

  Future<Ot> getOt() async {
    database.otDao.findOtBy(otSaved.IDOT).then((value) => saveOt(value));
    print("Recuperation OT");
    return otSaved;
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

  Future<List<Document>> getAllDocument() async {
    return await database.documentDao.getAllDocuments();
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

  Future<void> saveData(Site site, Config config) async {
    await database.siteDao.insertSite(site);
    await database.configDao.insertConfig(config);
  }

  Future<void> addNewOt(int idEquipement, int idOrigine, int idCategorie, String libelleOt) async {
    int newIdOT = 0;
    List<Ot> lastdata = await database.otDao.sortTable();

    newIdOT = lastdata.first.IDOT;
    newIdOT++;

    Ot newOt = Ot(
      IDOT: newIdOT,
      CODEOT: "null",
      LIBELLEOT: libelleOt,
      IDORIGINE: idOrigine,
      IDEQUIPEMENT: idEquipement,
      IDCATEGORIE: idCategorie,
      NEWOT: true
    );

    await database.otDao.insertOt(newOt);
  }

  Future insertDocument(int idOt, Uint8List attachement) async {
    await database.documentDao.insertDocument(DocumentsCompanion(IDOT: Value(idOt), ATTACHEMENT: Value(attachement)));
  }

  Future<List<Ot>> findOtsBy(int idEquipement) async {
    return await database.otDao.findOtsBy(idEquipement);
  }

  Future<Equipement> findEquipementsBy(String codeEquipement) async {
    return await database.equipementDao.findEquipementBy(codeEquipement);
  }

  Future<List<Matricule>> findMatriculesChecked() async {
    return await findMatriculesChecked();
  }

  Future<Article> findArticleBy(String codeArticle) async {
    Article? article = null;
    try {
      article = await database.articleDao.findArticleBy(codeArticle);
      print("article trouve : "+article.toString());
      return  article;
    } on Exception catch (_) {
      print("article introuvé : "+article.toString());
      return  article!;
    }

  }

  Future<List<Reservation>> findReservationBy(int idOt) async {
    return await database.reservationDao.findReservationBy(idOt);
  }

  Future insertReservation(Article article, int idOt, double quantite ) async {
    int newId = 0;
    int flag=0;
    List<Reservation> lastdata = await database.reservationDao.sortTable();

    for (int i = 0; i < lastdata.length; i++){
      if (article.CODEARTICLE==lastdata[i].CODEARTICLE){
        print("déja présent------------");
        flag=1;
        await database.reservationDao.modifieReservation(
            Reservation(
                IDPIECE: lastdata[i].IDPIECE,
                CODEARTICLE: article.CODEARTICLE,
                LIBELLEARTICLE: article.LIBELLEARTICLE,
                QTEARTICLE: quantite,
                IDARTICLE: article.IDARTICLE,
                IDOT: idOt,
                NEWRESERVATION: true
            )
        );
      }
    }
    if (flag!=1){
      newId = lastdata.first.IDPIECE;
      newId++;
      await database.reservationDao.insertReservation(
          Reservation(
              IDPIECE: newId ,
              CODEARTICLE: article.CODEARTICLE,
              LIBELLEARTICLE: article.LIBELLEARTICLE,
              QTEARTICLE: quantite,
              IDARTICLE: article.IDARTICLE,
              IDOT: idOt,
              NEWRESERVATION: false
          )
      );
      flag=0;
    }

   /* await database.reservationDao.insertReservation(

    );*/
  }

  Future modifyReservation(Reservation reservation) async {
    await database.reservationDao.modifieReservation(reservation);
  }

  Future modifyArticle(Article article) async {
    await database.articleDao.modifieArticle(article);
  }

  Future<List<Tache>> findTachesBy(int idOt) async {
    return database.tacheDao.findTachesBy(idOt);
  }

  Future modifyOt(Ot ot) async {
    await database.otDao.modifieOt(ot);
  }

  Future modifyTache(Tache tache) async {
    await database.tacheDao.modifieTache(tache);
  }

  Future modifyCommentOt(int idOt, String comment) async {
    await database.otDao.updateComment(idOt, comment);
  }
}
