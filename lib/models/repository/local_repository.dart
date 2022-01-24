//Vue vers bdd et bdd  vers vue

import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/ot.dart';

@Environment(Env.prod)
@injectable
class LocalRepository {
  final IomerDatabase database;

  LocalRepository(this.database);

  Future<List<Matricule>> getAllMatricule() {
    print(database.matriculeDao.getAllMatricules().toString());
    return database.matriculeDao.getAllMatricules();
  }

  Future<List<OtData>> getAllOt() {
    print(database.otDao.getAllOts().toString());
    return database.otDao.getAllOts();
  }





}
