import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iomer/models/bdd/iomer_database.dart';


void main() {
  late IomerDatabase db;

  setUp(() {
    db = IomerDatabase(NativeDatabase.memory());
  });
  tearDown(() async {
    await db.close();
  });

  test("site can be created", () async {
    var site = Site(IDSITE: 101010, CODESITE: "CODESITE", NOMSITE: "NOMSITE", ADRESSESITE: "ADRESSESITE");
    await db.siteDao.insertSite(site);
    List<Site> siteDb = await db.siteDao.getAllSites();
    expect(siteDb.first, site);
  });
}


