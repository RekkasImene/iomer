import 'package:drift/drift.dart';

class Ot extends Table{
  IntColumn get idOt=>integer().autoIncrement()();
  IntColumn get idOrigine => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Origines(idOrigine)')();
  IntColumn get idCategorie => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Categories(idCategorie)')();
  IntColumn get idEquipement => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Equipements(idEquipement)')();
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
