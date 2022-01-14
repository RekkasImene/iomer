import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/categorie.g.dart';


class Categories extends Table {
  IntColumn get IDCATEGORIE => integer().autoIncrement()();
  IntColumn get IDSITE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Sites(IDSITE)')();
  TextColumn get CODECATEGORIE => text().withLength(min: 1, max: 12)();
  TextColumn get LIBELLECATEGORIE => text().withLength(min: 1, max: 48)();
  IntColumn get IDCATORIGINAL =>integer().nullable()();

  @override
  Set<Column> get primaryKey => {IDCATEGORIE};
}
@DriftAccessor(
    tables:[Categories]
)
class CategorieDao extends DatabaseAccessor<IomerDatabase> with _$CategorieDaoMixin{
  final IomerDatabase db;
  CategorieDao(this.db):super (db);

  Future insertCategorie(CategoriesCompanion categorie) => into(categories).insert(categorie);
  Future<List<Categorie>> getAllCategories() => select(categories).get();

}
