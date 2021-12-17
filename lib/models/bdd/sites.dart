import 'package:drift/drift.dart';

class Sites extends Table {
  IntColumn get idSite => integer().autoIncrement()();
  TextColumn get codeSite => text().withLength(min: 1, max: 50)();
  TextColumn get nomSite => text().withLength(min: 1, max: 50)();
  TextColumn get adresseSite => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {idSite};
}
