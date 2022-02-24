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
        final List<Reservation> reservation =
            await _localRepository.findReservationBy(ot.IDOT);

        if (reservation.isNotEmpty) {
          emit(PartsLoaded(reservation));
        } else {
          emit(const PartsError("Pas de données dans la base."));
        }
      }

      if (event is UpdateEventListParts) {
        for (int i = 0; i < event.listreservation.length; i++) {
          try {
            if (event.controller[i].text.isNotEmpty) {
              _localRepository.modifyReservation(Reservation(
                  IDPIECE: event.listreservation[i].IDPIECE,
                  LIBELLEARTICLE: event.listreservation[i].LIBELLEARTICLE,
                  IDOT: event.listreservation[i].IDOT,
                  CODEARTICLE: event.listreservation[i].CODEARTICLE,
                  QTEARTICLE: double.parse(event.controller[i].text),
                  IDARTICLE: event.listreservation[i].IDARTICLE));
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

      if (event is CodeEventPart) {
        Article article;

        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print("Code parts : " + event.codePart);
            article = await _inRepository.getArticle(event.codePart);
            print(article.toString());
            if (article.LIBELLEARTICLE.isNotEmpty) {
              emit(StateArticleFind(article.LIBELLEARTICLE,article.CODEARTICLE));
            } else {
              emit(StatePartsNoArticle(
                  'Pas d\'article trouvé pour se code article.'));
            }
          }
        } on SocketException catch (_) {
          print('Connexion internet non disponible, article non inséré');
          emit(StatePartsInternetInterrupt(
              'Connexion internet non disponible, article non inséré'));
        }
      }

      if (event is AddPieceEventParts) {
        double qte = 0;
        Article article;
        Ot ot = await _localRepository.getOt();

        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            if (event.piece.isNotEmpty & event.libelle.isNotEmpty & event.qte.isNotEmpty) {
              print("Jai passer les testes -- ");


                article = await _inRepository.getArticle(event.piece);
                print("Article WS : "+article.toString());
                if (article.CODEARTICLE.isNotEmpty) {
                  print("Je suis article WS");

                  await _localRepository.insertReservation(article, ot.IDOT, double.parse(event.qte));

                  print("Fin insertion");
                  emit(PartsStateAddArticle());
                } else {
                  emit(StatePartsNoArticle('Il n\'y a pas d\'article avec ce code article'));
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
