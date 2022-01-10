import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/article.g.dart';

class Articles extends Table {
  IntColumn get IDARTICLE => integer().autoIncrement()();
  TextColumn get CODEARTICLE => text().withLength(min: 1, max: 16)();
  TextColumn get LIBELLEARTICLE => text().withLength(min: 1, max: 48)();
  IntColumn get QTEARTICLE => integer()();
  IntColumn get IDARTICLEWS => integer()();

  @override
  Set<Column> get primaryKey => {IDARTICLE, CODEARTICLE};
}

@DriftAccessor(
  tables:[Articles]
)
class ArticleDao extends DatabaseAccessor<IomerDatabase> with _$ArticleDaoMixin{
  final IomerDatabase db;
  ArticleDao(this.db):super (db);
}
