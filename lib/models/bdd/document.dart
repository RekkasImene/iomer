import 'package:drift/drift.dart';

import 'iomer_database.dart';
part 'generate/document.g.dart';

class Documents extends Table {
  IntColumn get idAttachement => integer().autoIncrement()();
  IntColumn get idOt =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(idOt)')();
  TextColumn get attachement => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idAttachement};
}

@DriftAccessor(
    tables:[Documents]
)

class DocumentDao extends DatabaseAccessor<IomerDatabase> with _$DocumentDaoMixin{
  final IomerDatabase db;
  DocumentDao(this.db):super (db);
}
