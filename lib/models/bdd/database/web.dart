import 'package:drift/web.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/models/bdd/iomere_database.dart';

@injectable
IomereDatabase constructDb() {
  return IomereDatabase(WebDatabase('db'));
}