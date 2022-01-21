import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';

part 'workers_event.dart';
part 'workers_state.dart';

@Environment(Env.prod)
@injectable
class WorkersBloc extends Bloc<WorkersEvent, WorkersState> {
  final InRepository _repository;

  WorkersBloc(this._repository) : super(WorkersInitial()) {
    on<WorkersEvent>((event, emit) async {
      if (event is WorkersEvent) {
        emit(WorkerLoading());
        final matricule = await _repository.getAllWorkers();
        if (matricule != null) {
          emit(WorkerLoaded(matricule));
        } else {
          emit(const WorkerError('Error'));
        }
      }
    });
  }
}
