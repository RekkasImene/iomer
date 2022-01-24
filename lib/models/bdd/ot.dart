import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/ot.g.dart';

class Ot extends Table{
  IntColumn get IDOT=>integer()();
  IntColumn get IDORIGINE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Origines(IDORIGINE)')();
  IntColumn get IDCATEGORIE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Categories(IDCATEGORIE)')();
  IntColumn get IDEQUIPEMENT => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Equipements(IDEQUIPEMENT)')();
  TextColumn get CODEOT => text().withLength(min:0,max: 24)();
  TextColumn get LIBELLEOT => text().withLength(min:0,max: 48)();
  TextColumn get COMMENTOT => text().withLength(min:0,max: 2048)();
  RealColumn get TEMPSOT => real()();
  TextColumn get STATUTOT=> text().withLength(min:1,max: 1)();

  DateTimeColumn get DTOPENOT=>dateTime().nullable()(); //date  (Unix timestamp in seconds)
  DateTimeColumn get DTEXECOT=>dateTime().nullable()();
  DateTimeColumn get DTWAITOT=>dateTime().nullable()();
  DateTimeColumn get DTCANCOT=>dateTime().nullable()();
  DateTimeColumn get DTCLOSOT=>dateTime().nullable()();


  @override
  Set<Column> get primaryKey => {IDOT};
}

@DriftAccessor(
    tables:[Ot]
)
class OtDao extends DatabaseAccessor<IomerDatabase> with _$OtDaoMixin{
  final IomerDatabase db;
  OtDao(this.db):super (db);

  Future insertOt(OtData otData) => into(ot).insertOnConflictUpdate(otData);
  Future<List<OtData>> getAllOts() => select(ot).get();

}

