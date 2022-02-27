import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/models/repository/local_repository.dart';

part 'matricule_event.dart';
part 'matricule_state.dart';

@Environment(Env.prod)
@injectable

/// Cette classe contient le Bloc de l'Ui [matricule]
/// Elle reçoit et traite les évenements définis dans [matricule_event],
/// émit un état de [matricule_state]
/// et déclenche par ce fait des méthodes de [LocalRepository]

class MatriculeBloc extends Bloc<MatriculeEvent, MatriculeState> {
  final LocalRepository _localRepository;

  MatriculeBloc(this._localRepository) : super(MatriculeInitial()) {
    on<MatriculeEvent>((event, emit) async {
      if (event is MatriculeEvent) {
        //un état initiale est émit
        emit(MatriculeLoading());
        //On récupère la listes des intervenants en appelant le local répository qui fait appel par
        //la suite au web service
        final matricule = await _localRepository.getAllMatricule();

        //si la liste n'est pas vide
        if (matricule.isNotEmpty) {
          //un etat de succès est émit
          emit(MatriculeLoaded(matricule));
        } else {
          //si non un état d'erreur est émit, cet état prend en paramètre le message d'erreur qu'on
          //souaite afficher
          emit(const MatriculeError('Error'));
        }
      }

      if (event is CheckedMatriculeEvenet) {
        if (event.matricule != null) {
          //ecrire dans la base de donnée
          await _localRepository.modifyMatricule(event.matricule);
          final matricule2 = await _localRepository.getAllMatricule();
          if (matricule2.isNotEmpty) {
            emit(CheckMatriculeUpdated(matricule2));
          }
        }
      }
    });
  }
}
