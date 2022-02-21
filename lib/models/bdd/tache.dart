import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/tache.g.dart';

class Taches extends Table {
  IntColumn get IDTACHE => integer()();

  IntColumn get IDOT =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(IDOT)')();

  TextColumn get CODETACHE => text().withLength(min: 1, max: 24)();

  TextColumn get LIBELLETACHE => text().withLength(min: 1, max: 48)();

  IntColumn get STATUTTACHE =>
      integer().nullable().withDefault(const Constant(0))();

  TextColumn get COMMENTTACHE => text().nullable().withLength(max: 2018)();

  @override
  Set<Column> get primaryKey => {CODETACHE, IDTACHE};
}

@DriftAccessor(tables: [Taches])
class TacheDao extends DatabaseAccessor<IomerDatabase> with _$TacheDaoMixin {
  final IomerDatabase db;

  TacheDao(this.db) : super(db);

  Future insertTache(Tache tache) => into(taches).insertOnConflictUpdate(tache);

  Future<List<Tache>> getAllTaches() => select(taches).get();

  Future<List<Tache>> findTachesBy(int idOt) {
    return (select(taches)..where((tache) => tache.IDOT.equals(idOt))).get();
  }

  Future modifieTache(Tache tache) => update(taches).replace(tache);
}
