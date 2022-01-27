import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';

part 'sites_event.dart';
part 'sites_state.dart';

@Environment(Env.prod)
@injectable
class SitesBloc extends Bloc<SitesEvent, SitesState> {

  final InRepository _Inrepository;

  SitesBloc(this._Inrepository) : super(SitesInitial()) {
    on<SitesEvent>((event, emit) async {
      if (event is FetchEventSites) {
        emit(SitesLoading());
        final List<Site> sites = await _Inrepository.getAllSite();
        if (sites.isNotEmpty) {
          emit(SitesLoaded(sites));
        } else {
          emit(const SitesError('Error'));
        }
      }
      if (event is ValidateEventSites) {
        if(event.monsite != null) {
          print("Mon site selectionné est  :"+ event.monsite.NOMSITE);
          _Inrepository.InsertSite(event.monsite);
        } else {
          emit(const SitesError('Error'));
        }
      }
    });
  }
}
