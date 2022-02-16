import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'parts_event.dart';

part 'parts_state.dart';

@Environment(Env.prod)
@injectable
class PartsBloc extends Bloc<PartsEvent, PartsState> {
  final LocalRepository _localRepository;

  PartsBloc(this._localRepository) : super(PartsInitial()) {
    on<PartsEvent>((event, emit) async {
      if (event is FetchEventParts) {
        emit(PartsLoading());
        Ot ot = await _localRepository.getOt();
        final List<Reservation> reservation = await _localRepository.findReservationBy(ot.IDOT);
        if (reservation.isNotEmpty) {
          emit(PartsLoaded(reservation));
        } else {
          emit(const PartsError('Error'));
        }
      }

      if (event is UpdateEventListParts) {
        emit(PartsLoading());
        for (int i = 0; i < event.listreservation.length; i++) {
          _localRepository.modifyReservation(event.listreservation[i]);
        }
        emit(PartsUpdate());
      }
    });


  }
}
