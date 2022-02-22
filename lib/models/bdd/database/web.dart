import 'package:drift/web.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/models/bdd/iomer_database.dart';

@injectable
IomerDatabase constructDb() {
  return IomerDatabase(WebDatabase('db'));
}