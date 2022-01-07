import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/ot.g.dart';

class Ot extends Table{
  IntColumn get idOt=>integer().autoIncrement()();
  IntColumn get idOrigine => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Origines(idOrigin)')();
  IntColumn get idCategorie => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Categories(idCategorie)')();
  IntColumn get idEquipement => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Equipements(idEquipement)')();
  TextColumn get codeOt => text().withLength(min:0,max: 24)();
  TextColumn get libellOt => text().withLength(min:0,max: 48)();
  TextColumn get comentOt => text().withLength(min:0,max: 2048)();
  RealColumn get tempsOt => real()();
  TextColumn get statutOt=> text().withLength(min:1,max: 1)();

  DateTimeColumn get dtOpenOt=>dateTime()(); //date  (Unix timestamp in seconds)
  DateTimeColumn get dtExecOt=>dateTime()();
  DateTimeColumn get dtWaitOt=>dateTime()();
  DateTimeColumn get dtCancOt=>dateTime()();
  DateTimeColumn get dtClosOt=>dateTime()();

  @override
  Set<Column> get primaryKey => {idOt};
}

@DriftAccessor(
    tables:[Ot]
)
class OtDao extends DatabaseAccessor<IomerDatabase> with _$OtDaoMixin{
  final IomerDatabase db;
  OtDao(this.db):super (db);
}

