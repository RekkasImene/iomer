import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/article.g.dart';

class Articles extends Table {
  IntColumn get idArticle => integer().autoIncrement()();
  TextColumn get codeArticle => text().withLength(min: 1, max: 16)();
  TextColumn get libelleArticle => text().withLength(min: 1, max: 48)();
  IntColumn get qteArticle => integer()();

  @override
  Set<Column> get primaryKey => {idArticle, codeArticle};
}

@DriftAccessor(
  tables:[Articles]
)

class ArticleDao extends DatabaseAccessor<IomerDatabase> with _$ArticleDaoMixin{
  final IomerDatabase db;
  ArticleDao(this.db):super (db);
}
