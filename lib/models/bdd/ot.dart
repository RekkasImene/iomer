import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/ot.g.dart';

class Ot extends Table {
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

  TextColumn get COMENTOT => text().withLength(min: 0, max: 2048)();

  RealColumn get TEMPSOT => real()();

  TextColumn get STATUTOT => text().withLength(min: 1, max: 1)();

  DateTimeColumn get DTOPENOT =>
      dateTime()(); //date  (Unix timestamp in seconds)
  DateTimeColumn get DTEXECOT => dateTime()();

  DateTimeColumn get DTWAITOT => dateTime()();

  DateTimeColumn get DTCANCOT => dateTime()();

  DateTimeColumn get DTCLOSOT => dateTime()();

  IntColumn get IDOTORIGINAL => integer().nullable()();

  @override
  Set<Column> get primaryKey => {IDOT};
}

@DriftAccessor(tables: [Ot])
class OtDao extends DatabaseAccessor<IomerDatabase> with _$OtDaoMixin {
  final IomerDatabase db;

  OtDao(this.db) : super(db);
}
