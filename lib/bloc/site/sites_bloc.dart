import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/in_repository.dart';
import 'package:iomere/models/repository/local_repository.dart';

part 'sites_event.dart';
part 'sites_state.dart';

@Environment(Env.prod)
@injectable
class SitesBloc extends Bloc<SitesEvent, SitesState> {
  final InRepository _inRepository;

  late StreamController<bool> nextNav = StreamController<bool>.broadcast();

  SitesBloc(this._inRepository) : super(SitesInitial()) {
    on<SitesEvent>((event, emit) async {
      _inRepository.flag.stream.listen((event) {
        nextNav.add(event);
      });

      if (event is FetchEventSites) {
        emit(SitesLoading());
        final List<Site> sites = await _inRepository.getAllSite();
        print(sites.toString());
        if (sites.isNotEmpty) {
          emit(SitesLoaded(sites));
        } else {
          emit(SitesError("Une erreure s'est produite"));
          print("Error");
        }
      }

      if (event is ValidateEventSites) {
        if (event.monsite != null || event.macategorie != null) {
          print("Mon site selectionné est  :" + event.monsite.NOMSITE);
          print("Ma categorie : " + event.macategorie);
          await _inRepository.deleteAllDatabase();
          bool etat = await _inRepository.pushDB(
              event.monsite.IDSITE, event.macategorie);
          if (etat == true) {
            emit(NavigationState());
          } else {
            log("emiiiiit");
            emit(SitesReload());
          }
        }
      }
    });
  }
}
