part of 'taches_bloc.dart';

abstract class TachesState extends Equatable {
  const TachesState();

  @override
  List<Object> get props => [];
}

class TachesInitial extends TachesState {}

class TachesLoading extends TachesState {}

class TachesLoaded extends TachesState {
  final List<Tache> taches;

  const TachesLoaded(this.taches);
}

class TachesError extends TachesState {
  final String message;

  const TachesError(this.message);
}

class CheckTacheUpdated extends TachesState {
  final List<Tache> taches;

  const CheckTacheUpdated(this.taches);
}
