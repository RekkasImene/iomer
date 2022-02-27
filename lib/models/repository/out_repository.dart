//bdd vers webservice

import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/document.dart';
import 'package:iomere/models/bdd/iomere_database.dart';
import 'package:iomere/models/bdd/matricule.dart';
import 'package:iomere/models/bdd/ot.dart';
import 'package:iomere/models/bdd/reservation.dart';
import 'package:iomere/models/bdd/tache.dart';
import 'package:iomere/models/repository/in_repository.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:iomere/webService/services.dart';

/// Cette classe contient les méthodes d'envoie des données de la based de donnée locale vers le WebService
/// Fait appelle aux méthodes de classe [Services]
@Environment(Env.prod)
@singleton
@injectable
class OutRepository {
  final IomereDatabase database;
  final Services services;
  final LocalRepository localRepository;
  final InRepository inRepository;
  OutRepository(this.database, this.services, this.localRepository,this.inRepository);

  ///Envoyer les [Ots] cloturés
  Future<void> pushOts() async {
    try{
      List<Ot> ots = await localRepository.getOtsClosed();
      if (ots.isNotEmpty) {
        for (var ot in ots) {
        ///Si l'ot n'existe pas dans le WebService, en créer un nouveau et l'envoyer
          if (ot.NEWOT!) {
            await services.createOt(ot.IDEQUIPEMENT!, ot.IDORIGINE!, ot.IDCATEGORIE!, ot.LIBELLEOT);
          ///S'il s'agit d'un ot déja existant dans le WebService, envoyer ses nouvelles valeurs
          } else {
            await services.postOt(
                ot.IDOT,
                ot.COMMENTOT!,
                ot.DTCLOSOT!.difference(ot.DTOPENOT!).inMinutes.toDouble(),
                //temps en minute
                ot.STATUTOT!);
          }
        }
      }
    } catch (e) {
      log("Je suis catch ----------------- ");
      rethrow;
    }
  }
///Envoyer les nouvelles valeurs de [Matricules] dans le WebService
  Future<void> pushMatricules() async {
    //Matricules traitement
    var matricules = await localRepository.getAllMatricule() ;
    for (var matricule in matricules) {
      log("les maticules "+matricule.toString());
      await services.postMatricule(matricule.IDMATRICULE, matricule.CHECKED??0);
    }
  }
  ///Envoyer les [Reservations] dans le WebService
  Future<void> pushReservations() async {
    try {
      List<Reservation> reservations = await localRepository.getAllReservation(); //reservations de la base local

      if (reservations.isNotEmpty) {
        for (var reservation in reservations) {
          /// Si la reservation n'existe pas dans le WebService, en créer une nouvelle et l'envoyer
          if (reservation.NEWRESERVATION!) {
            await services.createOtArticle(
                reservation.IDOT!, reservation.IDARTICLE, reservation.QTEARTICLE);
          } else {///S'il s'agit d'une reservation déja existante dans le WebService, envoyer ses nouvelles valeurs
            await services.postOtArticle(reservation.IDPIECE, reservation.QTEARTICLE);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }
///Envoyer les [Taches] dans le WebService
  Future<void> pushTaches() async{
    try {
      var taches = await localRepository.getAllTache();
      if(taches.isNotEmpty) {
        for (var tache in taches) {
          await services.postOtTache(tache.IDTACHE,tache.STATUTTACHE.toString(),tache.COMMENTTACHE!);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
  ///Envoyer les [Documents] dans le WebService
  Future<void> pushDocuments() async{
    var documents = await localRepository.getAllDocument();
    for (var document in documents) {
      await services.postAttachment(document.IDOT!, base64Encode(document.ATTACHEMENT));
    }
  }

  ///Methode qui fait appelle aux fonctions d'envoi de donnée de la bdd vers WebService
  Future<bool> pushWS() async {
    bool flag;
    try {
      //Matricules traitement
      log("----------1-------------");
      await pushMatricules();
      log("----------2-------------");
      //Documents traitement
      await pushDocuments();
      log("----------3-------------");
      //Traitement taches
      await pushTaches();
      log("----------3-------------");
      //Traitement OT
      await pushOts();
      log("----------4-------------");
      //Reservations Traitement
      await pushReservations();
      log("----------5-------------");
      flag = true;
    }catch(e){
      flag = false;
    }
    services.client.close();
    return flag;
  }
}
