import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/categorie.g.dart';

class Categories extends Table {
  IntColumn get idCategorie => integer().autoIncrement()();
  IntColumn get idSite => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Sites(idSite)')();
  TextColumn get codeCategorie => text().withLength(min: 1, max: 12)();
  TextColumn get libelleCategorie => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idCategorie};
}

@DriftAccessor(tables:[Categories])
class CategorieDao extends DatabaseAccessor<IomerDatabase> with _$CategorieDaoMixin{
  final IomerDatabase db;
  CategorieDao(this.db):super (db);
}
