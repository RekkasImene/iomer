import 'package:injectable/injectable.dart';

import '../iomere_database.dart';

@injectable
IomereDatabase constructDb({bool logStatements = false}) {
  throw 'Platform not supported';
}