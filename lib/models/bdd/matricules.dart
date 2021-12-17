import 'package:drift/drift.dart';

class Matricules extends Table {
  IntColumn get idMatricule => integer().autoIncrement()();
  IntColumn get idOrigine => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Origin(idOrigin)')();
  TextColumn get codeMatricule => text().withLength(min: 1, max: 12)();
  TextColumn get nomMatricule => text().withLength(min: 1, max: 48)();
  TextColumn get prenomMatricule => text().withLength(min: 1, max: 48)();
  BoolColumn get checked => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {idMatricule};
}
