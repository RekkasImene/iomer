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

  void updateSite(){
    futureSite = fetchSite();
    futureSite.then((value) {
      value.forEach((e) {
        database.siteDao.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE: e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,
        ));
      });
    }).catchError((error) {
      log(error);
    });
  }

  Future<List<Site>> getAllSite() {
    return database.siteDao.getAllSites();
  }
}