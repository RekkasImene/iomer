import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/webService/services.dart';

part 'sites_event.dart';
part 'sites_state.dart';

class SitesBloc extends Bloc<SitesEvent, SitesState> {
  InRepository _repository;
  SitesBloc(this._repository) : super(SitesInitial()) {
    on<SitesEvent>((event, emit) async {
      if (event is SitesEvent) {
        emit(SitesLoading());
        final sites = await _repository.getAllSite();
        if (sites != null) {
          emit(SitesLoaded(sites));
        } else {
          emit(SitesError('Error'));
        }
      }
    });
  }
}
