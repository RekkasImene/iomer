import 'package:drift/drift.dart';

class Taches extends Table {
  IntColumn get idOt =>
      integer().nullable().customConstraint('NULL REFERENCES M2_OT(idOt)')();
  TextColumn get codeTache => text().withLength(min: 1, max: 24)();
  TextColumn get libelleTache => text().withLength(min: 1, max: 48)();
  TextColumn get statutTache => text().withLength(min: 1, max: 1)();
  TextColumn get commentTache => text().withLength(min: 1, max: 2018)();
  IntColumn get idTache => integer()();

  @override
  Set<Column> get primaryKey => {codeTache};
}
