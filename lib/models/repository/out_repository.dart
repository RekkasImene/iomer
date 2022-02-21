//bdd vers webservice

import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:iomer/webService/services.dart';

@Environment(Env.prod)
@singleton
@injectable
class OutRepository {
  final IomerDatabase database;
  final Services services;
  final LocalRepository localRepository;
  final InRepository inRepository;
  OutRepository(this.database, this.services, this.localRepository,this.inRepository);

  Future<void> pushOT() async {
    List<Ot> ots = await localRepository.getAllOt();
    ots.forEach((ot) {
      if (ot.NEWOT!) {
        services.createOt(
            ot.IDEQUIPEMENT!,
            ot.IDORIGINE!,
            ot.IDCATEGORIE!,
            ot.LIBELLEOT
        );
      }else{
        services.postOt(
            ot.IDOT,
            ot.COMMENTOT!,
            ot.DTCLOSOT!.difference(ot.DTOPENOT!).inMinutes.toDouble(), //temps en minute
            ot.STATUTOT!
        );
      }
    });
  }

  Future<void> pushWS() async {
    //Matricules traitement
    var matricules = await localRepository.getAllMatricule() ;
    matricules.forEach((matricule) {
      services.postMatricule(matricule.IDMATRICULE, matricule.CHECKED! ? 1 : 0);
    });
    //Traitement OT vers WS
    await pushOT();
    //Reservations Traitement
    List<Reservation> reservations = await localRepository.getAllReservation(); //reservations de la base local
  }
}
