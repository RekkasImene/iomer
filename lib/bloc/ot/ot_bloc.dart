import 'dart:async';
import 'dart:io';

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
        print("FetchEventOt :");
        emit(OtLoading());
        final List<Ot> ots = await _repository.getAllOt();
        if (ots.isNotEmpty) {
          emit(OtLoaded(ots));
        } else {
          emit(const OtError('Error'));
        }
      }

      if (event is NewEventOt) {
        print("NewEventOt :");
        await _repository.addNewOt(110, 14, event.categorie.IDCATEGORIE, event.categorie.LIBELLECATEGORIE).then((value) => add(FetchEventOt()));
      }

      if (event is SelectEventOt){
        print("SelectEventOt :");
        Ot ot=await _repository.getOt();
        emit(OtSelected(ot));
      }

      if (event is SetEventOt){
        print("SetEventOt :");
        if (event.ot != null ) {
          _repository.saveOt(event.ot);
        }
      }
    });
  }
}
