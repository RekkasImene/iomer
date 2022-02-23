import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/in_repository.dart';
import 'package:iomere/models/repository/local_repository.dart';

part 'parts_event.dart';
part 'parts_state.dart';

@Environment(Env.prod)
@injectable
class PartsBloc extends Bloc<PartsEvent, PartsState> {
  final LocalRepository _localRepository;
  final InRepository _inRepository;

  PartsBloc(this._localRepository, this._inRepository) : super(PartsInitial()) {
    on<PartsEvent>((event, emit) async {


      if (event is FetchEventParts) {
        emit(PartsLoading());
        Ot ot = await _localRepository.getOt();
        final List<Reservation> reservation = await _localRepository.findReservationBy(ot.IDOT);

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
            emit(PartsUpdate());
          } catch (e) {
            emit(const PartsError("Ce nest pas un nombre.."));
          }
        }
      }

      if (event is InternetEventParts) {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            emit(StatePartsInternetOk());
          }
        } on SocketException catch (_) {
          print('not connected');
          emit(StatePartsInternetError('Internet non disponible.'));
        }
      }





      if (event is AddPieceEventParts) {
        double qte = 0;
        Article article;
        Reservation reservation;
        Ot ot = await _localRepository.getOt();

        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('Toujours connect');
            if (event.piece.isNotEmpty){
            article = await _localRepository.findArticleBy(event.piece);

            print("article local ================== " + article.toString());
            if (article != null) {
              if (event.qte.isNotEmpty) {
                qte = double.parse(event.qte);
              } else {
                qte = article.QTEARTICLE;
              }
              print("qte  ================== " + qte.toString());
              if (article.QTEARTICLE != qte) {
                article = article.copyWith(QTEARTICLE: qte);
                _localRepository.modifyArticle(article);
                print("local  qte diff ===============");
                emit(PartsStateAddArticle());
              }
              else {
                print("local qte non diff ===============");
                emit(PartsStateAddArticle());
              }
            } else {
              article = await _inRepository.getArticle(event.piece);
              print("article web ================== " + article.toString());
              if (article != null) {
                if (event.qte.isNotEmpty) {
                  qte = double.parse(event.qte);
                } else {
                  qte = article.QTEARTICLE;
                }
                qte = double.parse(event.qte);
                if (article.QTEARTICLE != qte) {
                  article = article.copyWith(QTEARTICLE: qte);
                  await _localRepository.insertReservation(article, ot.IDOT);
                  print("web qte non diff ===============");
                  emit(PartsStateAddArticle());
                } else {
                  await _localRepository.insertReservation(article, ot.IDOT);
                  print("web qte diff ===============");
                  emit(PartsStateAddArticle());
                }
              } else {
                emit(StatePartsNoArticle(
                    'Pas d\'article trouvé pour se code article.'));
              }
            }
          }

          }
        } on SocketException catch (_) {
          print('Connexion internet non disponible, article non inséré');
          emit(StatePartsInternetInterrupt('Connexion internet non disponible, article non inséré'));
        }
      }

    });

  }
}