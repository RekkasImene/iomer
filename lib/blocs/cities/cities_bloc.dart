import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Cubit<CitiesState> {

  late final InRepository repository;

  CitiesBloc(this.repository) : super(CitiesInitial());

  @override
  Stream<CitiesState?> mapEventToState(
      CitiesEvent event,
  ) async* {
     if (event is GetCities) {
       try {
         yield CitiesLoading();
         final list = await repository.database.siteDao.getAllSites();
         yield CitiesLoaded(list);
       } on Exception {
         yield GetCitiesFailure("Erreur connexion...");
       }
     }
  }
}