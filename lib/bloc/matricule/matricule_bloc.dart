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

///Les évenements de l'utilisateur sur la vue matricule sont receptionnés par le bloc MatriculeBloc et tr
class MatriculeBloc extends Bloc<MatriculeEvent, MatriculeState> {

  final LocalRepository _localRepository;

  MatriculeBloc(this._localRepository) : super(MatriculeInitial()) {
    on<MatriculeEvent>((event, emit) async {

      if (event is MatriculeEvent) {
        emit(MatriculeLoading());
        final matricule = await _localRepository.getAllMatricule();
        if (matricule.isNotEmpty) {
          emit(MatriculeLoaded(matricule));
        } else {
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
