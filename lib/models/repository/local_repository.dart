//Vue vers bdd et bdd  vers vue

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

@Environment(Env.prod)
@injectable
class LocalRepository {
  final IomerDatabase database;

  LocalRepository(this.database);

  Future<List<OtData>> getOt() {
    print(database.otDao.getAllOts());
    return database.otDao.getAllOts();
  }

}
