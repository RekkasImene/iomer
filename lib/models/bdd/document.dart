import 'package:drift/drift.dart';

import 'iomer_database.dart';

part 'generate/document.g.dart';

class Documents extends Table {
  IntColumn get IDATTACHEMENT => integer().autoIncrement()();

  IntColumn get IDOT =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(IDOT)')();

  BlobColumn get ATTACHEMENT => blob()();

  @override
  Set<Column> get primaryKey => {IDATTACHEMENT};
}

@DriftAccessor(tables: [Documents])
class DocumentDao extends DatabaseAccessor<IomerDatabase>
    with _$DocumentDaoMixin {
  final IomerDatabase db;

  DocumentDao(this.db) : super(db);

  Future insertDocument(DocumentsCompanion document) =>
      into(documents).insertOnConflictUpdate(document);

  Future<List<Document>> getAllDocuments() => select(documents).get();
}
