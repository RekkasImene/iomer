import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get idCategorie => integer().autoIncrement()();
  IntColumn get idSite => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idSite)')();
  TextColumn get codeCategorie => text().withLength(min: 1, max: 12)();
  TextColumn get libelleCategorie => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idCategorie};
}
