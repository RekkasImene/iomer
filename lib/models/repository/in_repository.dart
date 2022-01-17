//webservice vers bdd

import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/site.dart';
import 'package:iomer/webService/services.dart';

@Environment(Env.prod)
@injectable
abstract class InRepositoryAbs {
  Future<List<Site>> getAllSite();
}

class InRepository extends InRepositoryAbs {
  late IomerDatabase database;
  late Future<List<Site>> futureSite;

  void updateSite() {
    futureSite = fetchSite();
    futureSite.then((value) {
      value.forEach((e) {
          database.siteDao.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE: e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,
          //IDSITEORIGINAL: Value(e.IDSITE),
        ));
      });
    }).catchError((error) {
      log(error);
    });
  }

  @override
  Future<List<Site>> getAllSite() {
    return database.siteDao.getAllSites();
  }
}
