import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/equipement.g.dart';

class Equipements extends Table {
  IntColumn get IDEQUIPEMENT => integer()();

  IntColumn get IDSITE =>
      integer().nullable().customConstraint('NULL REFERENCES Sites(IDSITE)')();

  TextColumn get CODEEQUIPEMENT => text().withLength(min: 1, max: 12)();

  TextColumn get LIBELLEEQUIPEMENT => text().withLength(min: 1, max: 48)();

  IntColumn get IDEQUIPEMENTORIGINAL => integer().nullable()();

  @override
  Set<Column> get primaryKey => {IDEQUIPEMENT};
}

@DriftAccessor(tables: [Equipements])
class EquipementDao extends DatabaseAccessor<IomerDatabase>
    with _$EquipementDaoMixin {
  final IomerDatabase db;

  EquipementDao(this.db) : super(db);
}
