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
        if (event.equipement != null) {
          print("Equipement : " + event.equipement.toString());
          emit(OtLoading());
          final List<Ot> ots =
              await _repository.findOtsBy(event.equipement!.IDEQUIPEMENT);
          if (ots.isNotEmpty) {
            print("Evenement OT Loaded....." + ots.toString());
            emit(OtLoaded(ots));
          } else {
            emit(const OtError('Error'));
          }
        } else {
          emit(OtLoaded(List<Ot>.empty()));
        }
      }

      if (event is NewEventOt) {
        await _repository.getAllOrigine();
        Equipement equipement =
            await _repository.findEquipementsBy(event.codeMachine);
        List<Matricule> matricule = await _repository.getAllMatricule();
        await _repository
            .addNewOt(equipement.IDEQUIPEMENT, matricule.first.IDORIGINE!,
                event.categorie.IDCATEGORIE, event.categorie.LIBELLECATEGORIE)
            .then((value) => add(FetchEventOt(equipement)));
      }

      if (event is CodeEventMachine) {
        if (event.codeEquipement != "") {
          final Equipement equipement =
              await _repository.findEquipementsBy(event.codeEquipement);
          print(equipement.toString());
          if (equipement != null) {
            emit(CodeMachineLoaded(equipement.LIBELLEEQUIPEMENT));
            add(FetchEventOt(equipement));
          } else {
            emit(const OtError('Error'));
          }
        } else {
          emit(CodeMachineLoaded(""));
        }
      }

      if (event is SelectEventOt) {
        //print("selectEventOt.......");
        Ot ot = await _repository.getOt();
        emit(OtSelected(ot));
      }

      if (event is SetEventOt) {
        _repository.saveOt(event.ot);
      }
    });
  }
}
