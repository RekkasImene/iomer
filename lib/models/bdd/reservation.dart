import 'package:drift/drift.dart';
import 'iomer_database.dart';

part 'generate/reservation.g.dart';

class Reservations extends Table {
  IntColumn get IDPIECE => integer()();

  IntColumn get IDOT =>
      integer().nullable().customConstraint('NULL REFERENCES Ot(IDOT)')();

  TextColumn get CODEARTICLE => text()
      .withLength(min: 1, max: 24)
      .nullable()
      .customConstraint('NULL REFERENCES Articles(IDARTICLE)')();

  TextColumn get LIBELLEARTICLE => text().withLength(min: 1, max: 48)();

  IntColumn get QTEARTICLE => integer()();

  IntColumn get IDARTICLE => integer()();

  @override
  Set<Column> get primaryKey => {IDPIECE};
}

@DriftAccessor(tables: [Reservations])
class ReservationDao extends DatabaseAccessor<IomerDatabase>
    with _$ReservationDaoMixin {
  final IomerDatabase db;

  ReservationDao(this.db) : super(db);

  Future insertReservation(Reservation reservation) =>
      into(reservations).insertOnConflictUpdate(reservation);

  Future<List<Reservation>> getAllReservations() => select(reservations).get();

  Future<List<Reservation>> findReservationBy(int idOt) {
    return (select(reservations)..where((reservation) =>
        reservation.IDOT.equals(idOt))).get();
  }
  Future modifieReservation(Reservation reservation) =>
      update(reservations).replace(reservation);
  Future<List<Reservation>> sortTable() {
    return (select(reservations)
      ..orderBy([
            (t) => OrderingTerm(expression: t.IDPIECE, mode: OrderingMode.desc)
      ]))
        .get();
  }
}
