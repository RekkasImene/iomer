//webservice vers bdd

import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';
@Environment(Env.prod)
@injectable
class InRepository {
  final IomerDatabase database;
  InRepository(this.database);
  late Future<List<Site>> futureSites;
  late Future<List<Origine>> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late Future<List<OtData>> futureOTs;
  late Future<List<Categorie>> futureCategories;
  late Future<List<Reservation>> futureReservations;
  late Future<List<Article>> futureArticles;
  late Future<List<Equipement>> futureEquipements;
  late Future<List<Tache>> futureTaches;

  void updateSite(){
    futureSites = fetchSites();
    futureSites.then((value) {
      value.forEach((e) {
        database.siteDao.insertSite(e);
       
      });
    }).catchError((error) {
      log(error);
    });
  }


  void updateOrigines(int idSite){
    futureOrigines=fetchOrigines(idSite);

    futureOrigines.then((value){
      value.forEach((e){
        database.origineDao.insertOrigine(e);
          
      });
    }).catchError((error){
      log(error);
    });

  }

  void updateMatricules(int idOrigine){
    futureMatricules = fetchMatricules(idOrigine);
    futureMatricules.then((value){
      value.forEach((e){
        database.matriculeDao.insertMatricule(e);
        log("table matricule insérée");
       
      });
    } ).catchError((error){
      log(error);
    });
  }


  void updateOTs(int idSite, int idOrigine){
    futureOTs = fetchOTs(idSite, idOrigine);
    futureOTs.then((value){
      value.forEach((e){
       database.otDao.insertOt(e);
       log("table ot insérée");
      });
    }).catchError((error){
      log(error);
    });
  }

  void updateCategories(int idSite){
    futureCategories = fetchCategories(idSite);
    futureCategories.then((value){
      value.forEach((e){
       database.categorieDao.insertCategorie(e);
      });
    }).catchError((error){
      log(error);
    });

  }

  void updateReservation(int idOt){
    futureReservations = fetchReservations(idOt);
    futureReservations.then((value){
      value.forEach((e){
       database.reservationDao.insertReservation(e);
       log ("table reservation insérée");
      });
    }).catchError((error){
      log(error);
    });

  }
    void updateArticles(String codeArticle){
    futureArticles = fetchArticles(codeArticle);
    futureArticles.then((value){
      value.forEach((e){
       database.articleDao.insertArticle(e);
       log ("table articles insérée");
      });
    }).catchError((error){
      log(error);
    });

  }

  void updateEquipements(int idSite){
    futureEquipements = fetchEquipements(idSite);
    futureEquipements.then((value){
      value.forEach((e){
       database.equipementDao.insertEquipement(e);
       log ("table équipement insérée");
      });
    }).catchError((error){
      log(error);
    });

  }

   void updateTaches(int idOT){
    futureTaches = fetchOTTaches(idOT);
    futureTaches.then((value){
      value.forEach((e){
       database.tacheDao.insertTache(e);
       log ("table tache insérée");
      });
    }).catchError((error){
      log(error);
    });

  }
  

  

  

  
  

}