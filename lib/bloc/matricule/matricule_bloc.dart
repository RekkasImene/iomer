import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:iomer/models/repository/out_repository.dart';

part 'matricule_event.dart';
part 'matricule_state.dart';

@Environment(Env.prod)
@injectable
class MatriculeBloc extends Bloc<MatriculeEvent, MatriculeState> {
  final LocalRepository _repository;

  MatriculeBloc(this._repository) : super(MatriculeInitial()) {
    on<MatriculeEvent>((event, emit) async {
      if (event is MatriculeEvent) {
        emit(MatriculeLoading());
        final matricule = await _repository.getAllMatricule();
        print(matricule.length);
        if (matricule != null) {
          emit(MatriculeLoaded(matricule));
        } else {
          emit(const MatriculeError('Error'));
        }
      }
      if (event is CheckedMatriculeEvenet) {
        //ecrire dans la base de donnée 
      }
    });
  }
}
