import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'cloture_event.dart';
part 'cloture_state.dart';

@Environment(Env.prod)
@injectable
class ClotureBloc extends Bloc<ClotureEvent, ClotureState> {
  final LocalRepository _localRepository;
  ClotureBloc(this._localRepository) : super(ClotureInitial()) {
    on<ClotureEvent>((event, emit) async {
      if (event is ClotureEvent) {
        Ot ot= await _localRepository.getOt();
        var now= DateTime.now();
        var duree= now.difference(ot.DTOPENOT!).toString();
        List<String> listDuration= duree.toString().split(":");
        print("Temps d'intervention= Heures:"+
            listDuration.first+ " Minutes:"+
            listDuration[1] + " Seconds:"+ listDuration.last );
        if(listDuration.isEmpty){
          emit(const ClotureError('Error Duration'));
        }else {
          emit(StateDurationOt(listDuration));
        }

      }

      if (event is SetCloseOt) {
        if (event.otCloseTime != null) {
          Ot ot = await _localRepository.getOt();
          print("ot    ====== "+ot.toString());
          await _localRepository.modifyOt(ot.copyWith(DTCLOSOT: event.otCloseTime));
          emit(ClotureEnd());
        }
      }
    });
  }
}
