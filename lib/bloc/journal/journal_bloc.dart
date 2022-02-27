import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/models/bdd/iomere_database.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:iomere/models/repository/out_repository.dart';

import '../../config/injection.dart';
import 'journal_event.dart';

part 'journal_state.dart';

@Environment(Env.prod)
@injectable
class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final OutRepository _outRepository;
  final LocalRepository _localRepository;

  JournalBloc(this._outRepository, this._localRepository)
      : super(JournalInitial()) {
    on<JournalEvent>((event, emit) async {
      if (event is FetchEventJournal) {
        emit(JournalStateLoading());
        final List<Ot> otsClotures = await _localRepository.getAllOt();
        if (otsClotures.isNotEmpty) {
          emit(JounalStateLoaded(otsClotures));
        } else {
          emit(JournalStateError());
        }
      }

      if (event is JournalEventSynchronisation) {
        bool flag = await _outRepository.pushWS();
        if (flag) {
          emit(const JournalStatePushSuccess('Synchronisation terminée'));
        } else {
          emit(const JournalStatePushFail('Synchronisation échoué veuillez recommencer'));
        }
      }
    });
  }
}
