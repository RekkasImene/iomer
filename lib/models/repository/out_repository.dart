//bdd vers webservice

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';


@Environment(Env.prod)
@singleton
@injectable
class OutRepository {
  final IomerDatabase database;
  OutRepository(this.database);




}
