import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:iomer/bloc/sites_bloc.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';

class SitesBloc extends Bloc<SitesEvent, SitesState> {
  final InRepository repository;
  SitesBloc(this.repository) : super(SitesInitial()) {
    on<SitesEvent>((event, emit) async {
      if (event is SitesEvent) {
        emit(SitesLoading());
        final sites = await repository.getAllSite();
        if (sites != null) {
          emit(SitesLoaded(sites));
        } else {
          emit(SitesError('Error'));
        }
      }
    });
  }
}
