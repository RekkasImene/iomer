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
  late Future<List<Site>> futureSite, futureOrigines, futureMatricules;

  void updateSite(){
    futureSite = fetchSite();
    futureSite.then((value) {
      value.forEach((e) {
        database.siteDao.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE: e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,
          IDSITEORIGINAL: Value(e.IDSITE),
        ));
      });
    }).catchError((error) {
      log(error);
    });
  }



void updateMatricules(int idOrigine){
  futureMatricules = fetchMatricules(idOrigine);
  futureMatricules.then((value){
    value.forEach((e){
      database.matriculeDao.insertMatricule( )
    })
  }
  
  )
}





  }







}