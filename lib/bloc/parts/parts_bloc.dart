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

      if (event is AddPieceEventParts) {
        double qte = 0;
        Ot ot = await _localRepository.getOt();
<<<<<<< HEAD
        //await _localRepository.insertArticle(event.piece, event.libelle, double.parse(event.qte));
        Article article = await _localRepository.findArticleBy(event.piece);
        log(article.toString());

        await _localRepository.insertReservation(article, ot.IDOT);

        emit(PartsStateAddArticle());
=======

        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('Toujours connect');
            Article article = await _inRepository.getArticle(event.piece);
            if(article != null) {
              if (event.qte.isEmpty) {
                qte= article.QTEARTICLE;
              } else {
                qte = double.parse(event.qte);
              }
              Reservation reservation = await _localRepository.insertReservation(article, ot.IDOT, qte);
              await _localRepository.modifyReservation(reservation.copyWith(QTEARTICLE: qte));
              emit(PartsStateAddArticle());
            } else {
              emit(StatePartsNoArticle('Pas d\'article trouvé pour se code article.'));
            }
          }
        } on SocketException catch (_) {
          print('Connexion internet non disponible, article non inséré');
          emit(StatePartsInternetInterrupt('Connexion internet non disponible, article non inséré'));
        }
>>>>>>> 16cb48374f1b3aeb8c58c557a3895827a12cf302
      }
    });
  }
}
