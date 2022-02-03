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
        print("Appel FetchEvent ............ ");
        emit(OtLoading());
        print("fin emit Loading");
        final List<Ot> ots = await _repository.getAllOt();
        if (ots.isNotEmpty) {
          emit(OtLoaded(ots));
        } else {
          emit(const OtError('Error'));
        }
      }

      if (event is FetchEventCategorie) {
        print("Appel FetchEventCategorie... ");
        emit(OtLoading());
        final List<Categorie> categories = await _repository.getAllCategory();
        if (categories.isNotEmpty) {
          print("Categories succès...");
          emit(CategoriesLoaded(categories));
        } else {
          emit(const OtError('Error'));
        }
      }

      if (event is NewEventOt) {
        print("New Event OT");
        //await _repository.addNewOt(110, 14, event.categorie.IDCATEGORIE, event.categorie.LIBELLECATEGORIE);
        emit(OtInsertLoaded());
      }

    });
  }
}
