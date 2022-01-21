//Vue vers bdd et bdd  vers vue

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

@Environment(Env.prod)
@injectable
class LocalRepository {
  final IomerDatabase database;

  LocalRepository(this.database);
  Future<List<Matricule>> getAllMatricule() {
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

}
