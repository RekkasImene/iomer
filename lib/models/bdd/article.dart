import 'package:drift/drift.dart';

class Article extends Table {
  IntColumn get idArticle => integer().autoIncrement()();
  TextColumn get codeArticle => text().withLength(min: 1, max: 16)();
  TextColumn get libelleArticle => text().withLength(min: 1, max: 48)();
  IntColumn get qteArticle => integer()();

  @override
  Set<Column> get primaryKey => {idArticle, codeArticle};
}
