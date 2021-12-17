import 'package:drift/drift.dart';

class Origin extends Table {
  IntColumn get idOrigin => integer().autoIncrement()();
  IntColumn get idSite => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idSite)')();
  TextColumn get codeOrigin => text().withLength(min: 1, max: 12)();
  TextColumn get libelleOrigin => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idOrigin};
}
