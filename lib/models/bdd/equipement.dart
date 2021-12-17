import 'package:drift/drift.dart';
import 'iomerDatabase.dart';
part 'generate/equipement.g.dart';

class Equipements extends Table {
  IntColumn get idEquipement => integer().autoIncrement()();
  IntColumn get idSite => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idSite)')();
  TextColumn get codeEquipement => text().withLength(min: 1, max: 12)();
  TextColumn get libelleEquipement => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idEquipement};
}

@DriftAccessor(
    tables:[Equipements]
)
class EquipementDao extends DatabaseAccessor<IomerDatabase> with _$EquipementDaoMixin{
  final IomerDatabase db;
  EquipementDao(this.db):super (db);
}
