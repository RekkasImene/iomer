import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/site.g.dart';

class Sites extends Table {
  IntColumn get IDSITE => integer()();
  TextColumn get CODESITE => text().withLength(min: 1, max: 50)();
  TextColumn get NOMSITE => text().withLength(min: 1, max: 50)();
  TextColumn get ADRESSESITE => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {IDSITE};
}
@DriftAccessor(
    tables:[Sites]
)
class SiteDao extends DatabaseAccessor<IomerDatabase> with _$SiteDaoMixin{
  final IomerDatabase db;
  SiteDao(this.db):super (db);

  Future insertSite(Site site) => into(sites).insert(site);
  Future<List<Site>> getAllSites() => select(sites).get();
}