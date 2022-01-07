import 'package:drift/drift.dart';
import 'iomer_database.dart';
part 'generate/reservation.g.dart';

class Reservations extends Table {
  IntColumn get idPiece => integer().autoIncrement()();
  IntColumn get idOt =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(idOt)')();
  TextColumn get codeArticle => text()
      .withLength(min: 1, max: 24)
      .nullable()
      .customConstraint('NULL REFERENCES Articles(idArticle)')();
  TextColumn get libelleArticle => text().withLength(min: 1, max: 48)();

  IntColumn get qteArticle => integer()();
  IntColumn get idArticle => integer()();

  @override
  Set<Column> get primaryKey => {idPiece};
}

@DriftAccessor(
    tables:[Reservations]
)
class ReservationDao extends DatabaseAccessor<IomerDatabase> with _$ReservationDaoMixin{
  final IomerDatabase db;
  ReservationDao(this.db):super (db);
}