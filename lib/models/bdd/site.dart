import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/site.g.dart';

class Sites extends Table {
  IntColumn get IDSITE => integer().autoIncrement()();
  TextColumn get CODESITE => text().withLength(min: 1, max: 50)();
  TextColumn get NOMSITE => text().withLength(min: 1, max: 50)();
  TextColumn get ADRESSESITE => text().withLength(min: 1, max: 50)();
  IntColumn get IDORIGINAL =>integer().nullable()();

  @override
  Set<Column> get primaryKey => {IDSITE};
}

@DriftAccessor(
    tables:[Sites]
)

class SiteDao extends DatabaseAccessor<IomerDatabase> with _$SiteDaoMixin{
  final IomerDatabase db;
  SiteDao(this.db):super (db);

  Future insertSite(SitesCompanion site) => into(sites).insert(site);
  Future<List<Site>> getAllSites() => select(sites).get();
}