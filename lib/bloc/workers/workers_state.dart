part of 'workers_bloc.dart';

abstract class WorkersState extends Equatable {
  const WorkersState();

  @override
  List<Object> get props => [];
}

class WorkersInitial extends WorkersState {}

class WorkerLoading extends WorkersState {}

class WorkerLoaded extends WorkersState {
  final List<Matricule> matricule;
  const WorkerLoaded(this.matricule);
}

class WorkerError extends WorkersState {
  final String message;
  const WorkerError(this.message);
}
