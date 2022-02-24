import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/bloc/ot/ot_bloc.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:iomere/models/repository/out_repository.dart';

import '../../config/injection.dart';
import 'journal_event.dart';

part 'journal_state.dart';

@Environment(Env.prod)
@injectable
class JournalBloc extends Bloc<JournalEvent, JournalState> {
  OutRepository _outRepository;
  LocalRepository _localRepository;

  JournalBloc(this._outRepository, this._localRepository)
      : super(JournalInitial()) {
    on<JournalEvent>((event, emit) async {
      if (event is FetchEventJournal) {
        emit(JournalStateLoading());
        final List<Ot> ots_clotures = await _localRepository.getAllOt();
        print(ots_clotures.toString());
        if (ots_clotures.isNotEmpty) {
          emit(JounalStateLoaded(ots_clotures));
        } else {
          emit(JournalStateError());
          print("Error");
        }
      }

      if (event is JournalEventSynchronisation) {
        bool flag = await _outRepository.pushWS();
        log("bonjoour lr flag "+flag.toString());
        if (flag) {
          emit(JournalStatePushSuccess('Synchronisation terminée'));
        } else {
          emit(JournalStatePushFail('Synchronisation échoué veuillez recommencer'));
        }
      }
    });
  }
}
