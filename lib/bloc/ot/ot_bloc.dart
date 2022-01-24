import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'ot_event.dart';
part 'ot_state.dart';

@Environment(Env.prod)
@injectable
class OtBloc extends Bloc<OtEvent, OtState> {
  final LocalRepository _repository;

  OtBloc(this._repository) : super(OtInitial()) {
    on<OtEvent>((event, emit) async {
      if (event is FetchEventOt) {
        emit(OtLoading());

        final List<OtData> ots = await _repository.getAllOt();
        if (ots.isNotEmpty) {
          emit(OtLoaded(ots));
        } else {
          emit(const OtError('Error'));
        }
      }
    });
  }
}

