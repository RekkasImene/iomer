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
  late Future<List<Site>> futureSite;
  late Future<List<Origine>> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late Future<List<OtData>> futureOTs;
  late Future<List<Categorie>> futureCategories;
  late Future<List<Reservation>> futureReservations;

  void updateSite(){
    futureSite = fetchSite();
    futureSite.then((value) {
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
      });
    }).catchError((error){
      log(error);
    });

  }
  

}