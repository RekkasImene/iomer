part of 'matricule_bloc.dart';

abstract class MatriculeState extends Equatable {
  const MatriculeState();

  @override
  List<Object> get props => [];
}

class MatriculeInitial extends MatriculeState {}

class MatriculeLoading extends MatriculeState {}

class MatriculeLoaded extends MatriculeState {
  final List<Matricule> matricules;
  const MatriculeLoaded(this.matricules);
}

class MatriculeError extends MatriculeState {
  final String message;
  const MatriculeError(this.message);
}

class CheckMatriculeUpdated extends MatriculeState {
  final List<Matricule> matricules;
  const CheckMatriculeUpdated(this.matricules);
}
