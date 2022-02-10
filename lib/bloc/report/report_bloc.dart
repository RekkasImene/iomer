import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';

part 'report_state.dart';

@Environment(Env.prod)
@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final LocalRepository _repository;

  ReportBloc(this._repository) : super(ReportInitial()) {
    on<ReportEvent>((event, emit) async {
      if (event is ValidateReport) {
        Ot ot = await _repository.getOt();
        event.listAttachements.forEach((element) async {
          await _repository.insertDocument(ot.IDOT, element);
        });

        await _repository.modifyCommentOt(ot.IDOT, event.textReport);
      } else {
        emit(const ReportError('Error'));
      }
    });
  }
}
