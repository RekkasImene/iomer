//webservice vers bdd

import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';


abstract class InRepositoryAbs {
  Future<List<Site>> getAllSite();
}

@Environment(Env.prod)
@singleton
@injectable
class InRepository extends InRepositoryAbs {

  late Future<List<Site>> futureSite;
  final IomerDatabase database;
  InRepository(this.database);

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
    return fetchSite();
  }
}
