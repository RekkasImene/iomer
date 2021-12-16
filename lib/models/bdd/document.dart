import 'package:drift/drift.dart';

class Document extends Table {
  IntColumn get idAttachement => integer().autoIncrement()();
  IntColumn get idOt =>
      integer().nullable().customConstraint('NULL REFERENCES M2_OT(idOt)')();
  TextColumn get attachement => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idAttachement};
}
