
import 'package:drift/drift.dart';

import 'iomere_database.dart';

part 'generate/matricule.g.dart';

class Matricules extends Table {
  IntColumn get IDMATRICULE => integer()();

  IntColumn get IDORIGINE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Origines(IDORIGINE)')();

  TextColumn get CODEMATRICULE => text().withLength(min: 1, max: 12)();

  TextColumn get NOMMATRICULE => text().withLength(min: 1, max: 48)();

  TextColumn get PRENOMMATRICULE => text().withLength(min: 1, max: 48)();

  IntColumn get CHECKED =>
      integer().nullable().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {IDMATRICULE};
}

@DriftAccessor(tables: [Matricules])
class MatriculeDao extends DatabaseAccessor<IomereDatabase>
    with _$MatriculeDaoMixin {
  final IomereDatabase db;

  MatriculeDao(this.db) : super(db);

  Future insertMatricule(Matricule matricule) =>
      into(matricules).insertOnConflictUpdate(matricule);

  Future<List<Matricule>> getAllMatricules() => select(matricules).get();

  Future modifieMatricule(Matricule matricule) =>
      update(matricules).replace(matricule);

  Future<List<Matricule>> findMatriculesChecket() {
    return (select(matricules)
          ..where((matricule) => matricule.CHECKED.equals(1)))
        .get();
  }
}
