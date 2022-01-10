import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/tache.g.dart';

class Taches extends Table {
  IntColumn get IDOT =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(IDOT)')();
  TextColumn get CODETACHE => text().withLength(min: 1, max: 24)();
  TextColumn get LIBELLETACHE => text().withLength(min: 1, max: 48)();
  TextColumn get STATUTTACHE => text().withLength(min: 1, max: 1)();
  TextColumn get COMMENTTACHE => text().withLength(min: 1, max: 2018)();
  IntColumn get IDTACHE => integer()();

  @override
  Set<Column> get primaryKey => {CODETACHE,IDTACHE};
}

@DriftAccessor(tables:[Taches])
class TacheDao extends DatabaseAccessor<IomerDatabase> with _$TacheDaoMixin{
  final IomerDatabase db;
  TacheDao(this.db):super (db);
}