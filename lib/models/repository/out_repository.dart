//bdd vers webservice

import 'dart:convert';

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
    List<Ot> ots = await localRepository.getOtsCloded();
    ots.forEach((ot) {
        if (ot.NEWOT!) {
          services.createOt(
              ot.IDEQUIPEMENT!, ot.IDORIGINE!, ot.IDCATEGORIE!, ot.LIBELLEOT);
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

  Future<void> pushMatricules() async {
    //Matricules traitement
    var matricules = await localRepository.getAllMatricule() ;
    matricules.forEach((matricule) {
      services.postMatricule(matricule.IDMATRICULE, matricule.CHECKED! ? 1 : 0);
    });
  }

  Future<void> pushReservations() async {
    List<Reservation> reservations = await localRepository
        .getAllReservation(); //reservations de la base local
    reservations.forEach((reservation) {
      if (reservation.NEWRESERVATION!) {
        services.createOtArticle(
            reservation.IDOT!, reservation.IDARTICLE, reservation.QTEARTICLE);
      } else {
        services.postOtArticle(reservation.IDPIECE, reservation.QTEARTICLE);
      }
    });
  }

  Future<void> pushTaches() async{
    var taches = await localRepository.getAllTache();
    taches.forEach((tache) {
      services.postOtTache(
          tache.IDTACHE,tache.STATUTTACHE.toString(),tache.COMMENTTACHE!);
    });
  }

  Future<void> pushDocuments() async{
    var documents = await localRepository.getAllDocument();
    documents.forEach((document) {
      services.postAttachment(document.IDOT!, base64Encode(document.ATTACHEMENT));
    });
  }

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

    services.client.close();
  }
}
