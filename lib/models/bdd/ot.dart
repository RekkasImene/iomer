import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';




class Ot extends Table{
  IntColumn get idOt=>integer().autoIncrement()();
  IntColumn get idOrigin => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idOrigin)')();
  IntColumn get idCategorie => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idCategorie)')();
  IntColumn get idEquipement => integer()
      .nullable()
      .customConstraint('NULL REFERENCES table Sites(idEquipement)')();
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
