import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'parts_event.dart';

part 'parts_state.dart';

@Environment(Env.prod)
@injectable
class PartsBloc extends Bloc<PartsEvent, PartsState> {
  final LocalRepository _localRepository;

  PartsBloc(this._localRepository) : super(PartsInitial()) {
    on<PartsEvent>((event, emit) async {
      if (event is FetchEventParts) {
        emit(PartsLoading());
        Ot ot = await _localRepository.getOt();
        final List<Reservation> reservation = await _localRepository.findReservationBy(ot.IDOT);
        print(ot.toString());
        print(reservation.toString());


        if (reservation.isNotEmpty) {
          emit(PartsLoaded(reservation));
        } else {
          emit(const PartsError("Pas de données dans la base."));
        }
      }

      if (event is UpdateEventListParts) {
        for(int i=0;i<event.listreservation.length;i++) {
          try {
            if(event.controller[i].text.isNotEmpty) {

              _localRepository.modifyReservation(
                  Reservation(
                      IDPIECE: event.listreservation[i].IDPIECE,
                      LIBELLEARTICLE: event.listreservation[i].LIBELLEARTICLE,
                      IDOT: event.listreservation[i].IDOT,
                      CODEARTICLE: event.listreservation[i].CODEARTICLE,
                      QTEARTICLE: double.parse(event.controller[i].text),
                      IDARTICLE: event.listreservation[i].IDARTICLE
                  )
              );

            }
          } catch (e) {
            print("Ce nest pas un nombre..");
          }
        }
        emit(PartsUpdate());
      }

      if (event is AddPieceEventParts) {
        late double quantite;
        print(event.piece+";"+event.libelle+";"+event.qte);
        Ot ot = await _localRepository.getOt();
        print(ot.toString());
        Article article = await _localRepository.findArticleBy(event.piece);
        print(article.toString());

        if(event.qte.isNotEmpty) {
          quantite = double.parse(event.qte);
        } else {
          quantite = article.QTEARTICLE;
        }

        _localRepository.insertReservation(
            Article(
                IDARTICLE: article.IDARTICLE,
                CODEARTICLE: article.CODEARTICLE,
                LIBELLEARTICLE: article.LIBELLEARTICLE,
                QTEARTICLE: quantite
            ), ot.IDOT, ot.IDEQUIPEMENT!);
      }
    });
  }
}