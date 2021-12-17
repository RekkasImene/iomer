import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';




class Ot extends Table{
  IntColumn get id_ot=>integer().autoIncrement()();
  IntColumn get id_origin => integer()();
  IntColumn get id_categorie => integer()();
  IntColumn get id_equipement => integer()();
  TextColumn get code_ot => text().withLength(min:0,max: 24)();
  TextColumn get libell_ot => text().withLength(min:0,max: 48)();
  TextColumn get coment_ot => text().withLength(min:0,max: 2048)();
  RealColumn get temps_ot => real()();
  TextColumn get statut_ot=> text().withLength(min:1,max: 1)();

  DateTimeColumn get dt_open_ot=>dateTime()(); //date  (Unix timestamp in seconds)
  DateTimeColumn get dt_exec_ot=>dateTime()();
  DateTimeColumn get dt_wait_ot=>dateTime()();
  DateTimeColumn get dt_canc_ot=>dateTime()();
  DateTimeColumn get dt_clos_ot=>dateTime()();

}
