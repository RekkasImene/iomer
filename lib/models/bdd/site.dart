import 'package:drift/drift.dart';
import 'iomerDatabase.dart';
part 'generate/site.g.dart';

class Sites extends Table {
  IntColumn get idSite => integer().autoIncrement()();
  TextColumn get codeSite => text().withLength(min: 1, max: 50)();
  TextColumn get nomSite => text().withLength(min: 1, max: 50)();
  TextColumn get adresseSite => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {idSite};
}
@DriftAccessor(
    tables:[Sites]
)
class SiteDao extends DatabaseAccessor<IomerDatabase> with _$SiteDaoMixin{
  final IomerDatabase db;
  SiteDao(this.db):super (db);


  Future insertSite(Site site) => into(sites).insert(site);
}