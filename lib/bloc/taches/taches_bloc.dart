import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomere_database.dart';
import 'package:iomere/models/repository/local_repository.dart';

part 'taches_event.dart';
part 'taches_state.dart';
/// Cette classe contient le Bloc de l'Ui [task]
/// Elle reçoit et traite les évenements définis dans [taches_event], et déclenche par ce fait des méthodes de [LocalRepository]
@Environment(Env.prod)
@injectable
class TachesBloc extends Bloc<TachesEvent, TachesState> {
  final LocalRepository _localRepository;
  TachesBloc(this._localRepository)
      : super(TachesInitial()) {
    on<TachesEvent>((event, emit) async {
      if (event is TachesEvent) {
        emit(TachesLoading());
        Ot selectedOT = await _localRepository.getOt();
        final taches = await _localRepository.findTachesBy(selectedOT.IDOT);
        if (taches.isNotEmpty) {
          emit(TachesLoaded(taches));
        } else {
          emit(TachesError('Error'));
        }
      }
      if (event is CheckedTachesEvenet) {
        if (event.tache != null) {
          Ot selectedOT = await _localRepository.getOt();
          //ecrire dans la base de donnée
          await _localRepository.modifyTache(event.tache);
          final tache2 = await _localRepository.findTachesBy(selectedOT.IDOT);
          if (tache2 != null) {
            emit(CheckTacheUpdated(tache2));
          }
        }
      }
    });
  }
}
