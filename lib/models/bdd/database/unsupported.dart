import 'package:injectable/injectable.dart';

import '../iomer_database.dart';

@injectable
IomerDatabase constructDb({bool logStatements = false}) {
  throw 'Platform not supported';
}