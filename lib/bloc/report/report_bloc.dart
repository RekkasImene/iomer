import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final LocalRepository _repository;

  ReportBloc(this._repository) : super(ReportInitial()) {
    on<ReportEvent>((event, emit) {

      if(event is ReportLoaded) {

      } else {
        emit(const ReportError('Error'));
      }

    });
  }
}
