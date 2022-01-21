import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/matricule.g.dart';

class Matricules extends Table {
  IntColumn get IDMATRICULE => integer()();
  IntColumn get IDORIGINE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Origines(IDORIGINE)')();
  TextColumn get CODEMATRICULE => text().withLength(min: 1, max: 12)();
  TextColumn get NOMMATRICULE => text().withLength(min: 1, max: 48)();
  TextColumn get PRENOMMATRICULE => text().withLength(min: 1, max: 48)();
  BoolColumn get CHECKED =>
      boolean().nullable().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {IDMATRICULE};
}

@DriftAccessor(tables: [Matricules])
class MatriculeDao extends DatabaseAccessor<IomerDatabase>
    with _$MatriculeDaoMixin {
  final IomerDatabase db;
  MatriculeDao(this.db) : super(db);
}
