import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/config.g.dart';

class Config extends Table {
  IntColumn get IDSITE => integer().autoIncrement()();
  TextColumn get CODEPOCKET => text().withLength(min: 1, max: 16)();
  TextColumn get NOMPOCKET => text().withLength(min: 1, max: 48)();
  IntColumn get IDORIGINE => integer().autoIncrement()();
  IntColumn get IDORIGINAL => integer().autoIncrement()();


  @override
  Set<Column> get primaryKey => {CODEPOCKET};
}

@DriftAccessor(
    tables:[Config]
)
class ConfigDao extends DatabaseAccessor<IomerDatabase> with _$ConfigDaoMixin{
  final IomerDatabase db;
  ConfigDao(this.db):super (db);
}