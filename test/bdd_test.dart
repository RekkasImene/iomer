import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iomere/models/bdd/iomer_database.dart';

void main() {
  late IomerDatabase db;

  setUp(() {
    db = IomerDatabase(NativeDatabase.memory());
  });
  tearDown(() async {
    await db.close();
  });

  group("test ArticleDao", () {
    test("articles can be created", () async {
      var article = Article(
          IDARTICLE: 101010,
          CODEARTICLE: "CODEARTICLE",
          LIBELLEARTICLE: "LIBELLEARTICLE",
          QTEARTICLE: 10);
      await db.articleDao.insertArticle(article);
      List<Article> articleDb = await db.articleDao.getAllArticles();
      expect(articleDb.first, article);
    });
  });

  group("test CategorieDao", () {
    test("categories can be created", () async {
      var categorie = Categorie(
          IDCATEGORIE: 101010,
          CODECATEGORIE: "CODECATEGORI",
          LIBELLECATEGORIE: "LIBELLECATEGORIE",
          IDSITE: 1);
      await db.categorieDao.insertCategorie(categorie);
      List<Categorie> categorieDb = await db.categorieDao.getAllCategories();
      expect(categorieDb.first, categorie);
    });
  });

  group("test ConfigDao", () {
    test("configs can be created", () async {
      var config = Config(
          IDSITE: 101010,
          IDORIGINE: 1010,
          CODEORIGINE: "CODEORIGINE",
          CODEPOCKET: "CODEPOCKET",
          LIBELLEORIGINE: "LIBELLEORIGINE",
          NOMPOCKET: "NOMPOCKET");
      await db.configDao.insertConfig(config);
      List<Config> configDb = await db.configDao.getAllConfigs();
      expect(configDb.first, config);
    });
  });

  group("test DocumentDao", () {
    test("documents can be created", () async {
      var document = Document(
          IDATTACHEMENT: 101010,
          ATTACHEMENT: Uint8List.fromList([01, 02, 03, 05]));
      await db.documentDao.insertDocument(document.toCompanion(true));
      List<Document> documentDb = await db.documentDao.getAllDocuments();
      expect(documentDb.first, document);
    });
  });

  group("test EquipementDao", () {
    test("equipements can be created", () async {
      var equipement = Equipement(
          IDEQUIPEMENT: 101010,
          CODEEQUIPEMENT: "CODEEQUIPEME",
          LIBELLEEQUIPEMENT: "LIBELLEEQUIPEMENT",
          IDSITE: 1010);
      await db.equipementDao.insertEquipement(equipement);
      List<Equipement> equipementDb =
          await db.equipementDao.getAllEquipements();
      expect(equipementDb.first, equipement);
    });
  });

  group("test MatriculeDao", () {
    test("matricules can be created", () async {
      var matricule = Matricule(
          IDMATRICULE: 101010,
          CODEMATRICULE: "CODEMATRICUL",
          NOMMATRICULE: "NOMMATRICULE",
          PRENOMMATRICULE: "PRENOMMATRICULE",
          CHECKED: false);
      await db.matriculeDao.insertMatricule(matricule);
      List<Matricule> matriculeDb = await db.matriculeDao.getAllMatricules();
      expect(matriculeDb.first, matricule);
    });
  });

  group("test OtDao", () {
    test("ots can be created", () async {
      var ot = Ot(IDOT: 101010, CODEOT: "CODEOT", LIBELLEOT: 'LIBELLEOT');
      await db.otDao.insertOt(ot);
      List<Ot> otDb = await db.otDao.getAllOt();
      expect(otDb.first, ot);
    });
  });

  group("test ReservationDao", () {
    test("reservations can be created", () async {
      var reservation = Reservation(
          IDARTICLE: 101010,
          QTEARTICLE: 10,
          LIBELLEARTICLE: 'LIBELLEARTICLE',
          IDPIECE: 1010);
      await db.reservationDao.insertReservation(reservation);
      List<Reservation> reservationDb =
          await db.reservationDao.getAllReservations();
      expect(reservationDb.first, reservation);
    });
  });

  group("test SiteDao", () {
    test("site can be created", () async {
      var site = Site(
          IDSITE: 101010,
          CODESITE: "CODESITE",
          NOMSITE: "NOMSITE",
          ADRESSESITE: "ADRESSESITE");
      await db.siteDao.insertSite(site);
      List<Site> siteDb = await db.siteDao.getAllSites();
      expect(siteDb.first, site);
    });
  });

  group("test TacheDao", () {
    test("taches can be created", () async {
      var tache = Tache(
          IDTACHE: 101010,
          CODETACHE: "CODETACHE",
          LIBELLETACHE: "LIBELLETACHE",
          STATUTTACHE: 1);
      await db.tacheDao.insertTache(tache);
      List<Tache> tacheDb = await db.tacheDao.getAllTaches();
      expect(tacheDb.first, tache);
    });
  });
}
