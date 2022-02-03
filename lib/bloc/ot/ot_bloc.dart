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
        print("Appel FetchEvent ");
        emit(OtLoading());
        final List<Ot> ots = await _repository.getAllOt();
        if (ots.isNotEmpty) {
          emit(OtLoaded(ots));
        } else {
          emit(const OtError('Error'));
        }
      }

      if (event is NewEventOt) {
        String label;
        print(event.numero);
        if(event == 1) { label = "Corrective" ; } else { label = "Preventive"; }
        if (event.numero != null ) {
          print("ajout repo");
          await _repository.addNewOt(110, 14, 12, label);
        }
        add(FetchEventOt());
        print("Appui FetchEvent.......");
      }

      if (event is selectEventOt){
        final Ot ot = new Ot(IDOT: 1, CODEOT: "1", LIBELLEOT: "");//await _repository.GetOt;
        emit(OtSelected(ot));

      }
    });
  }
}

