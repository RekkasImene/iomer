import 'package:drift/drift.dart';

import 'iomer_database.dart';

part 'generate/origine.g.dart';

class Origines extends Table {
  IntColumn get IDORIGINE => integer()();

  IntColumn get IDSITE =>
      integer().nullable().customConstraint('NULL REFERENCES Sites(IDSITE)')();

  TextColumn get CODEORIGINE => text().withLength(min: 1, max: 12)();

  TextColumn get LIBELLEORIGINE => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {IDORIGINE};
}

@DriftAccessor(tables: [Origines])
class OrigineDao extends DatabaseAccessor<IomerDatabase>
    with _$OrigineDaoMixin {
  final IomerDatabase db;

  OrigineDao(this.db) : super(db);

  Future insertOrigine(Origine origine) =>
      into(origines).insertOnConflictUpdate(origine);

  Future<List<Origine>> getAllOrigine() => select(origines).get();
}
