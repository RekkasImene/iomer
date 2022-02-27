import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomere_database.dart';
import 'package:iomere/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'ot_event.dart';
part 'ot_state.dart';


/// Cette classe contient le Bloc de l'Ui [machine]
/// Elle reçoit et traite les évenements définis dans [ot_event], et déclenche par ce fait des méthodes de [LocalRepository]
/// Emet un etat de [ot_state]
@Environment(Env.prod)
@injectable
class OtBloc extends Bloc<OtEvent, OtState> {
  final LocalRepository _repository;

  OtBloc(this._repository) : super(OtInitial()) {
    on<OtEvent>((event, emit) async {
      if (event is FetchEventOt) {
        if (event.equipement != null) {
          emit(OtLoading());
          final List<Ot> ots = await _repository.findOtsBy(event.equipement!.IDEQUIPEMENT);
          if (ots.isNotEmpty) {
            emit(OtLoaded(ots));
          } else {
            emit(OtLoaded(List<Ot>.empty()));
          }
        } else {
          emit(OtLoaded(List<Ot>.empty()));
        }
      }
      if (event is NewEventOt) {
        await _repository.getAllOrigine();
        Equipement equipement =
            await _repository.findEquipementsBy(event.codeMachine);
        List<Matricule> matricule = await _repository.getAllMatricule();
        await _repository.addNewOt(equipement.IDEQUIPEMENT, matricule.first.IDORIGINE!,
            event.categorie.IDCATEGORIE, event.categorie.LIBELLECATEGORIE)
            .then((value) => add(FetchEventOt(equipement)));
      }

      if (event is CodeEventMachine) {
        if (event.codeEquipement != "") {
          final Equipement equipement =
              await _repository.findEquipementsBy(event.codeEquipement);
          if (equipement != null) {
            emit(CodeMachineLoaded(equipement.LIBELLEEQUIPEMENT));
            add(FetchEventOt(equipement));
          } else {
            emit(const OtError('Error'));
          }
        } else {
          emit(const CodeMachineLoaded(""));
        }
      }

      if (event is SelectEventOt) {
        Ot ot = await _repository.getOt();
        emit(OtSelected(ot));
      }

      if (event is SetEventOt) {
        print("ot event  =========== "+ event.ot.toString());
        _repository.saveOt(event.ot);
      }

      if (event is SetOpenOt){
        Ot ot = await _repository.getOt();
        _repository.modifyOt(ot.copyWith(DTOPENOT: event.openDate));
      }
    });
  }
}
