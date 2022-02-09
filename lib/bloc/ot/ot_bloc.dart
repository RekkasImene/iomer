import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/bloc/categorie/categorie_bloc.dart';
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
        print("Appel FetchEvent ............ ");
        emit(OtLoading());
        final List<Ot> ots = await _repository.findOtsBy(event.equipement.IDEQUIPEMENT);
        if (ots.isNotEmpty) {
          emit(OtLoaded(ots));
        } else {
          emit(const OtError('Error'));
        }
      }

      if (event is NewEventOt) {
        print("New Event OT");
        await _repository.addNewOt(110, 14, event.categorie.IDCATEGORIE, event.categorie.LIBELLECATEGORIE).then((value) => add(FetchEventOt(event.equipement)));
      }

      if (event is CodeEventMachine) {

        if(event.codeEquipement != "") {
          final Equipement equipement = await _repository.findEquipementsBy(event.codeEquipement);
          if (equipement != null) {
            emit(CodeMachineLoaded(equipement.LIBELLEEQUIPEMENT));
            FetchEventOt(equipement);
          } else {
            emit(const OtError('Error'));
          }
        } else {
          print("Je suis event init....");
          emit(CodeMachineLoaded(""));
        }
      }

      if (event is SelectEventOt){
        print("selectEventOt.......");

        Ot ot=await _repository.getOt();
        emit(OtSelected(ot));
      }

      if (event is SetEventOt){
        if (event.ot != null ) {
          _repository.saveIdOt(event.ot);
        }
      }
    });
  }
}
