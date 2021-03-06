import 'package:drift/drift.dart';

import 'iomere_database.dart';

part 'generate/categorie.g.dart';

class Categories extends Table {
  IntColumn get IDCATEGORIE => integer()();

  IntColumn get IDSITE =>
      integer().nullable().customConstraint('NULL REFERENCES Sites(IDSITE)')();

  TextColumn get CODECATEGORIE => text().withLength(min: 1, max: 12)();

  TextColumn get LIBELLECATEGORIE => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {IDCATEGORIE};
}

@DriftAccessor(tables: [Categories])
class CategorieDao extends DatabaseAccessor<IomereDatabase>
    with _$CategorieDaoMixin {
  final IomereDatabase db;

  CategorieDao(this.db) : super(db);

  Future insertCategorie(Categorie categorie) =>
      into(categories).insertOnConflictUpdate(categorie);

  Future<List<Categorie>> getAllCategories() => select(categories).get();
}
