
import 'dart:async';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import '../bdd/iomer_database.dart';


/// [LocalRepository] gère l'envoi des données de la vue vers la base de donnée locale [IomerDatabase] et de la base de donnée locale vers la vue en mode hors ligne
/// La base de donnée est stockée dans db.sqlite à l'aide de Drift///
/// Les requêtes de la base de donnée sont définient dans le fichier DAO de chaque table
@Environment(Env.prod)
@singleton
@injectable
class LocalRepository {
  final IomerDatabase database;
  LocalRepository(this.database);

  ///Cloturer la base de donnée locale
  Future close() async {
    database.close();
  }
  Ot otSaved = Ot(IDOT: 0, CODEOT: "CODEOT", LIBELLEOT: "LIBELLEOT");


  ///Récupérer tous les [Matricule] de la base de donnée locale
  Future<List<Matricule>> getAllMatricule() async {
    return database.matriculeDao.getAllMatricules();
  }
  ///Récupérer tous les [Ot] de la base de donnée locale

  Future<List<Ot>> getOtsCloded() async {
    return await database.otDao.getOtsClose();
  }
  Future<List<Ot>> getAllOt() async {
    return await database.otDao.getAllOt();
  }
  ///Stocker tous les [Ot] dans la base de donnée locale
  void saveOt(Ot ot) async {
    otSaved = ot;
  }
  ///Récuperer un [Ot] de la base de donnée locale
  Future<Ot> getOt() async {
    await database.otDao
        .findOtBy(otSaved.IDOT)
        .then((value) => saveOt(value.first));
    return otSaved;
  }
  ///Récupérer tous les [Article] de la base de donnée locale
  Future<List<Article>> getAllArticle() async {
    return await database.articleDao.getAllArticles();
  }
  ///Récupérer toutes les [Categorie] de la base de donnée locale
  Future<List<Categorie>> getAllCategory() async {
    return await database.categorieDao.getAllCategories();
  }
  ///Récupérer tous les [Equipement] de la base de donnée locale
  Future<List<Equipement>> getAllEquipement() async {
    return await database.equipementDao.getAllEquipements();
  }
  ///Récupérer tous les [Document] de la base de donnée locale
  Future<List<Document>> getAllDocument() async {
    return await database.documentDao.getAllDocuments();
  }

  ///Récupérer toutes les [Origine] de la base de donnée locale
  Future<List<Origine>> getAllOrigine() async {
    return await database.origineDao.getAllOrigine();
  }
  ///Récupérer toutes les [Tache] de la base de donnée locale
  Future<List<Tache>> getAllTache() async {
    return await database.tacheDao.getAllTaches();
  }
  ///Récupérer tous les [Site] de la base de donnée locale
  Future<List<Site>> getAllSite() async {
    return database.siteDao.getAllSites();
  }
  ///Récupérer toutes les [Reservation] de la base de donnée locale
  Future<List<Reservation>> getAllReservation() async {
    return await database.reservationDao.getAllReservations();
  }
  ///Modifier [Matricule] dans la base de donnée locale
  Future<void> modifyMatricule(Matricule matricule) async {
    await database.matriculeDao.modifieMatricule(matricule);
  }
///Stocker [Site], et Config dans la base de donnée locale
  void saveData(Site site, Config config) {
    database.siteDao.insertSite(site);
    database.configDao.insertConfig(config);
  }
///Créer un nouvel [Ot], en lui attribuant un nouvel ID, générée à partir du dernier otID+1
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
///Insérer un [Document] dans la base de donnée
  Future insertDocument(int idOt, Uint8List attachement) async {
    database.documentDao.insertDocument(DocumentsCompanion(IDOT: Value(idOt), ATTACHEMENT: Value(attachement)));
  }
  ///Récupérer les [Ot] correspondant à un idEquipement
  Future<List<Ot>> findOtsBy(int idEquipement) async {
    return database.otDao.findOtsBy(idEquipement);
  }
///Récupérer les [Equipement] correspondant à un codeEquipement
  Future<Equipement> findEquipementsBy(String codeEquipement) async {
    return database.equipementDao.findEquipementBy(codeEquipement);
  }
  ///Récupérer les [Matricule] cochés (selectionnés)
  Future<List<Matricule>> findMatriculesChecked() async {
    return findMatriculesChecked();
  }
  ///Récupérer un [Article] correspondant à un codeArticle
  Future<Article> findArticleBy(String codeArticle) async {
    Article article =  await database.articleDao.findArticleBy(codeArticle);
    return article;
  }
  ///Récupérer une [Reservation] correspondant à un idOt
  Future<List<Reservation>> findReservationBy(int idOt) async {
    return database.reservationDao.findReservationBy(idOt);
  }
  ///Insérer une nouvelle [Reservation] dans la base de donnéee, en lui attribuant un nouvel ID, générée à partir du dernier IDPIECE+1
  Future insertReservation(Article article, int idOt ) async {
    int newId = 0;
    List<Reservation> lastdata = await database.reservationDao.sortTable();
    newId = lastdata.first.IDPIECE;
    newId++;
    await database.reservationDao.insertReservation(Reservation(
        IDPIECE: newId ,
        CODEARTICLE: article.CODEARTICLE,
        LIBELLEARTICLE: article.LIBELLEARTICLE,
        QTEARTICLE: article.QTEARTICLE,
        IDARTICLE: article.IDARTICLE,
        IDOT: idOt,
        NEWRESERVATION: true
    )

    );
  }
///Modification dans [Reservation]
  Future modifyReservation(Reservation reservation) async {
    database.reservationDao.modifieReservation(reservation);
  }
  ///Récupérer une [Tache] correspondant à un idOt
  Future<List<Tache>> findTachesBy(int idOt) async {
    return database.tacheDao.findTachesBy(idOt);
  }
///Modification dans [Ot]
  Future modifyOt(Ot ot) async {
    database.otDao.modifieOt(ot);
  }
///Modification dans [Tache]
  Future modifyTache(Tache tache) async {
    database.tacheDao.modifieTache(tache);
  }
///Ajouter un commentaire dans [Ot]
  Future modifyCommentOt(int idOt, String comment) async {
    database.otDao.updateComment(idOt, comment);
  }

  ///Modifier DTOPENOT de [Ot] ( date début d'intervention )
  Future modifyOpenOt(int idOt, DateTime openDate) async {
    database.otDao.updateDTOPENOT(idOt, openDate);
  }
}
