//bdd vers webservice

import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/document.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/matricule.dart';
import 'package:iomer/models/bdd/ot.dart';
import 'package:iomer/models/bdd/reservation.dart';
import 'package:iomer/models/bdd/tache.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:iomer/webService/services.dart';

/// Cette classe contient les méthodes d'envoie des données de la based de donnée locale vers le WebService
/// Fait appelle aux méthodes de classe [Services]
@Environment(Env.prod)
@singleton
@injectable
class OutRepository {
  final IomerDatabase database;
  final Services services;
  final LocalRepository localRepository;
  final InRepository inRepository;
  OutRepository(this.database, this.services, this.localRepository,this.inRepository);

  ///Envoyer les [Ots] cloturés
  Future<void> pushOts() async {
    List<Ot> ots = await localRepository.getOtsClosed();
    ots.forEach((ot) {
        ///Si l'ot n'existe pas dans le WebService, en créer un nouveau et l'envoyer
        if (ot.NEWOT!) {
          services.createOt(
              ot.IDEQUIPEMENT!, ot.IDORIGINE!, ot.IDCATEGORIE!, ot.LIBELLEOT);
          ///S'il s'agit d'un ot déja existant dans le WebService, envoyer ses nouvelles valeurs
        } else {
          services.postOt(
              ot.IDOT,
              ot.COMMENTOT!,
              ot.DTCLOSOT!.difference(ot.DTOPENOT!).inMinutes.toDouble(),
              //temps en minute
              ot.STATUTOT!);
        }
    });
  }
///Envoyer les nouvelles valeurs de [Matricules] dans le WebService
  Future<void> pushMatricules() async {
    //Matricules traitement
    var matricules = await localRepository.getAllMatricule() ;
    matricules.forEach((matricule) {
      services.postMatricule(matricule.IDMATRICULE, matricule.CHECKED! ? 1 : 0);
    });
  }
  ///Envoyer les [Reservations] dans le WebService
  Future<void> pushReservations() async {
    List<Reservation> reservations = await localRepository
        .getAllReservation(); //reservations de la base local
    reservations.forEach((reservation) {
      /// Si la reservation n'existe pas dans le WebService, en créer une nouvelle et l'envoyer
      if (reservation.NEWRESERVATION!) {
        services.createOtArticle(
            reservation.IDOT!, reservation.IDARTICLE, reservation.QTEARTICLE);
      } else {
        ///S'il s'agit d'une reservation déja existante dans le WebService, envoyer ses nouvelles valeurs
        services.postOtArticle(reservation.IDPIECE, reservation.QTEARTICLE);
      }
    });
  }
///Envoyer les [Taches] dans le WebService
  Future<void> pushTaches() async{
    var taches = await localRepository.getAllTache();
    taches.forEach((tache) {
      services.postOtTache(
          tache.IDTACHE,tache.STATUTTACHE.toString(),tache.COMMENTTACHE!);
    });
  }
  ///Envoyer les [Documents] dans le WebService
  Future<void> pushDocuments() async{
    var documents = await localRepository.getAllDocument();
    documents.forEach((document) {
      services.postAttachment(document.IDOT!, base64Encode(document.ATTACHEMENT));
    });
  }
///Methode qui fait appelle aux fonctions d'envoi de donnée de la bdd vers WebService
  Future<void> pushWS() async {
    //Matricules traitement
    await pushMatricules();
    //Documents traitement
    await pushDocuments();
    //Traitement taches
    await pushTaches();
    //Traitement OT
    await pushOts();
    //Reservations Traitement
    await pushReservations();

/// Fermer la connexion avec le Web Service
    services.client.close();
  }
}
