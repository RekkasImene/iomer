import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/config.g.dart';

class Config extends Table {
  IntColumn get IDSITE => integer()
      .nullable()
      .customConstraint('NULL REFERENCES Sites(IDSITE)')();
  TextColumn get CODEPOCKET => text().withLength(min: 1, max: 16)();
  TextColumn get NOMPOCKET => text().withLength(min: 1, max: 48)();
  IntColumn get IDORIGINE => integer().nullable()
      .customConstraint('NULL REFERENCES Origines(IDORIGINE)')();
 TextColumn get CODEORIGINE => text()();
 TextColumn get LIBELLEORIGINE => text()();


  @override
  Set<Column> get primaryKey => {CODEPOCKET};
}

@DriftAccessor(
    tables:[Config]
)
class ConfigDao extends DatabaseAccessor<IomerDatabase> with _$ConfigDaoMixin{
  final IomerDatabase db;
  ConfigDao(this.db):super (db);


   Future insertConfig(ConfigData configData) => into(config).insertOnConflictUpdate(configData);
  Future<List<ConfigData>> getAllConfigs() => select(config).get();

}