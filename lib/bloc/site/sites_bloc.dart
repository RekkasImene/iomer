import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/bloc/taches/taches_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/config.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:iomer/webService/services.dart';

part 'sites_event.dart';

part 'sites_state.dart';

@Environment(Env.prod)
@injectable
class SitesBloc extends Bloc<SitesEvent, SitesState> {
  final InRepository _Inrepository;
  final LocalRepository _localRepository;

  late StreamController<bool> nextnav = StreamController<bool>.broadcast();

  SitesBloc(this._Inrepository, this._localRepository) : super(SitesInitial()) {
    on<SitesEvent>((event, emit) async {
      _Inrepository.flag.stream.listen((event) {
        nextnav.add(event);
      });

      if (event is FetchEventSites) {
        emit(SitesLoading());
        final List<Site> sites = await _Inrepository.getAllSite();
        print(sites.toString());
        if (sites.isNotEmpty) {
          emit(SitesLoaded(sites));
        } else {
          print("Error");
        }
      }

      if (event is ValidateEventSites) {
        if (event.monsite != null || event.macategorie != null) {
          //print("Mon site selectionné est  :" + event.monsite.NOMSITE);
          //print("Ma categorie : " + event.macategorie);
          print("Delete bdd");
          await _Inrepository.deleteAllDatabase();
          print("PushDB");
          await _Inrepository.pushDB(event.monsite.IDSITE, event.macategorie);
          print("Fin");
          emit(NavigationState());
        }
      }
    });
  }
}
