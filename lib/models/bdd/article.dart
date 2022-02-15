import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/article.g.dart';

class Articles extends Table {
  IntColumn get IDARTICLE => integer()();

  TextColumn get CODEARTICLE => text().withLength(min: 1, max: 16)();

  TextColumn get LIBELLEARTICLE => text().withLength(min: 1, max: 48)();

  RealColumn get QTEARTICLE => real()();

  @override
  Set<Column> get primaryKey => {IDARTICLE, CODEARTICLE};
}

@DriftAccessor(tables: [Articles])
class ArticleDao extends DatabaseAccessor<IomerDatabase>
    with _$ArticleDaoMixin {
  final IomerDatabase db;

  ArticleDao(this.db) : super(db);

  Future insertArticle(Article article) =>
      into(articles).insertOnConflictUpdate(article);

  Future<List<Article>> getAllArticles() => select(articles).get();

  Future<Article> findArticleBy(String codeArticle) {
    return (select(articles)
          ..where((article) => article.CODEARTICLE.equals(codeArticle)))
        .getSingle();
  }
}
