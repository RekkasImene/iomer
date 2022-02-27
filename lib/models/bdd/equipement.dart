
import 'package:drift/drift.dart';

import 'iomere_database.dart';

part 'generate/equipement.g.dart';

class Equipements extends Table {
  IntColumn get IDEQUIPEMENT => integer()();

  IntColumn get IDSITE =>
      integer().nullable().customConstraint('NULL REFERENCES Sites(IDSITE)')();

  TextColumn get CODEEQUIPEMENT => text().withLength(min: 1, max: 12)();

  TextColumn get LIBELLEEQUIPEMENT => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {IDEQUIPEMENT};
}

@DriftAccessor(tables: [Equipements])
class EquipementDao extends DatabaseAccessor<IomereDatabase> with _$EquipementDaoMixin {
  final IomereDatabase db;

  EquipementDao(this.db) : super(db);

  Future insertEquipement(Equipement equipement) =>
      into(equipements).insertOnConflictUpdate(equipement);

  Future<List<Equipement>> getAllEquipements() => select(equipements).get();

  Future<Equipement> findEquipementBy(String codeEquipement) {
    //getMachinebyCodeMachine
    return (select(equipements)
          ..where(
              (equipement) => equipement.CODEEQUIPEMENT.equals(codeEquipement)))
        .getSingle();
  }
}
