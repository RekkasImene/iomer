import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/tache.g.dart';

class Taches extends Table {
  IntColumn get idOt => integer().nullable().customConstraint('NULL REFERENCES Ot(idOt)')();
  TextColumn get codeTache => text().withLength(min: 1, max: 24)();
  TextColumn get libelleTache => text().withLength(min: 1, max: 48)();
  TextColumn get statutTache => text().withLength(min: 1, max: 1)();
  TextColumn get commentTache => text().withLength(min: 1, max: 2018)();
  IntColumn get idTache => integer()();

  @override
  Set<Column> get primaryKey => {codeTache};
}

@DriftAccessor(tables:[Taches])
class TacheDao extends DatabaseAccessor<IomerDatabase> with _$TacheDaoMixin{
  final IomerDatabase db;
  TacheDao(this.db):super (db);
}