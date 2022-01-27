import 'dart:developer';

import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/ot.g.dart';

class Ots extends Table {
  IntColumn get IDOT => integer()();

  IntColumn get IDORIGINE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Origines(IDORIGINE)')();

  IntColumn get IDCATEGORIE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Categories(IDCATEGORIE)')();

  IntColumn get IDEQUIPEMENT => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Equipements(IDEQUIPEMENT)')();

  TextColumn get CODEOT => text().withLength(min: 0, max: 24)();

  TextColumn get LIBELLEOT => text().withLength(min: 0, max: 48)();

  TextColumn get COMMENTOT => text().nullable().withLength(min: 0, max: 2048)();

  RealColumn get TEMPSOT => real().nullable()();

  TextColumn get STATUTOT => text().nullable().withLength(min: 1, max: 1)();

  DateTimeColumn? get DTOPENOT =>
      dateTime().nullable()(); //date  (Unix timestamp in seconds)
  DateTimeColumn? get DTEXECOT => dateTime().nullable()();

  DateTimeColumn? get DTWAITOT => dateTime().nullable()();

  DateTimeColumn? get DTCANCOT => dateTime().nullable()();

  DateTimeColumn? get DTCLOSOT => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {IDOT};
}

@DriftAccessor(tables: [Ots])
class OtDao extends DatabaseAccessor<IomerDatabase> with _$OtDaoMixin {
  final IomerDatabase db;

  OtDao(this.db) : super(db);

  Future insertOt(Ot otData) => into(ots).insertOnConflictUpdate(otData);

  Future<List<Ot>> getAllOts() => select(ots).get();

  Future<List<Ot>> sortTable() {
    return (select(ots)
          ..orderBy([
            (t) => OrderingTerm(expression: t.IDOT, mode: OrderingMode.desc)
          ]))
        .get();
  }
  Future ModifieOt(Ot ot) {
    // using replace will update all fields from the entry that are not marked as a primary key.
    // it will also make sure that only the entry with the same primary key will be updated.
    // Here, this means that the row that has the same id as entry will be updated to reflect
    // the entry's title, content and category. As its where clause is set automatically, it
    // cannot be used together with where.
    return update(ots).replace(ot);
  }
}
