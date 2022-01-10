import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/origine.g.dart';


class Origines extends Table {
  IntColumn get idOrigin => integer().autoIncrement()();
  IntColumn get idSite => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Sites(idSite)')();
  TextColumn get codeOrigin => text().withLength(min: 1, max: 12)();
  TextColumn get libelleOrigin => text().withLength(min: 1, max: 48)();

  @override
  Set<Column> get primaryKey => {idOrigin};
}

@DriftAccessor(tables:[Origines])
class OrigineDao extends DatabaseAccessor<IomerDatabase> with _$OrigineDaoMixin{
  final IomerDatabase db;
  OrigineDao(this.db):super (db);
}
