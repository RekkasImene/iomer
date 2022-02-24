//bdd vers webservice

import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/in_repository.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:iomere/webService/services.dart';

@Environment(Env.prod)
@singleton
@injectable
class OutRepository {
  final IomerDatabase database;
  final Services services;
  final LocalRepository localRepository;
  final InRepository inRepository;
  OutRepository(this.database, this.services, this.localRepository,this.inRepository);

  Future<void> pushOts() async {
    try{
      List<Ot> ots = await localRepository.getOtsClosed();
      if (ots.isNotEmpty) {
        for (var ot in ots) {
          if (ot.NEWOT!) {
            await services.createOt(ot.IDEQUIPEMENT!, ot.IDORIGINE!, ot.IDCATEGORIE!, ot.LIBELLEOT);
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

  Future<void> pushMatricules() async {
    //Matricules traitement
    var matricules = await localRepository.getAllMatricule() ;
    for (var matricule in matricules) {
      log("les maticules "+matricule.toString());
      await services.postMatricule(matricule.IDMATRICULE, matricule.CHECKED??0);
    }
  }

  Future<void> pushReservations() async {
    try {
      List<Reservation> reservations = await localRepository.getAllReservation(); //reservations de la base local

      if (reservations.isNotEmpty) {
        for (var reservation in reservations) {
          if (reservation.NEWRESERVATION!) {
            await services.createOtArticle(
                reservation.IDOT!, reservation.IDARTICLE, reservation.QTEARTICLE);
          } else {
            await services.postOtArticle(reservation.IDPIECE, reservation.QTEARTICLE);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

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

  Future<void> pushDocuments() async{
    var documents = await localRepository.getAllDocument();
    for (var document in documents) {
      await services.postAttachment(document.IDOT!, base64Encode(document.ATTACHEMENT));
    }
  }

  Future<bool> pushWS() async {
    var flag;
    try {
      //Matricules traitement
      log("----------1-------------");
      await pushMatricules();
      log("----------2-------------");

      //Documents traitement
      //await pushDocuments();
      //Traitement taches
      await pushTaches();
      log("----------3-------------");

      //Traitement OT
      await pushOts();
      log("----------4-------------");

      //Reservations Traitement
      await pushReservations();
      log("----------5-------------");
      return true;
    }catch(e){
      return false;
    }
  }
}
