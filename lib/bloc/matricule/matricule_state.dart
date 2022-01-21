part of 'matricule_bloc.dart';

abstract class MatriculeState extends Equatable {
  const MatriculeState();

  @override
  List<Object> get props => [];
}

class MatriculeInitial extends MatriculeState {}

class MatriculeLoading extends MatriculeState {}

class MatriculeLoaded extends MatriculeState {
  final List<Matricule> matricule;
  const MatriculeLoaded(this.matricule);
}

class MatriculeError extends MatriculeState {
  final String message;
  const MatriculeError(this.message);
}
