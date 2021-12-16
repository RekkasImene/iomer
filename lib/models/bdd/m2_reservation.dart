import 'package:drift/drift.dart';

class M2_reservation extends Table {
  IntColumn get idPiece => integer().autoIncrement()();
  IntColumn get idOt =>
      integer().nullable().customConstraint('NULL REFERENCES M2_OT(idOt)')();
  TextColumn get codeArticle => text()
      .withLength(min: 1, max: 24)
      .nullable()
      .customConstraint('NULL REFERENCES Article(idArticle)')();
  TextColumn get libelleArticle => text().withLength(min: 1, max: 48)();

  IntColumn get qteArticle => integer()();
  IntColumn get idArticle => integer()();

  @override
  Set<Column> get primaryKey => {idPiece};
}
