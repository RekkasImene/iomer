//Vue vers bdd et bdd  vers vue, mode hors ligne

import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

import '../bdd/iomer_database.dart';

@Environment(Env.prod)
@singleton
@injectable
class LocalRepository {
  final IomerDatabase database;

  LocalRepository(this.database);

  Future<List<Matricule>> getAllMatricule() {
    log(database.matriculeDao.getAllMatricules().toString());
    return database.matriculeDao.getAllMatricules();
  }

  void addNewOt(
      int idEquipement, int idOrigine, int idCategorie, String libelleOt) {
    int newIdOT = 0;
    Future<List<OtData>> lastdata = database.otDao.sortTable();

    lastdata.then((value) {
      log("msgg " + value.toString());

      newIdOT = value.first.IDOT;
      newIdOT++;
      log("idOt incréemente" + newIdOT.toString());

      OtData newOt = OtData(
          IDOT: newIdOT,
          CODEOT: "null",
          LIBELLEOT: libelleOt,
          IDORIGINE: idOrigine,
          IDEQUIPEMENT: idEquipement,
          IDCATEGORIE: idCategorie);

      log("affiches moi mon new ot" + newOt.toString());
      database.otDao.insertOt(newOt);

      log("Insert new ot " + newOt.toString());
    }).catchError((error) {
      log(error);
    });
  }









}
