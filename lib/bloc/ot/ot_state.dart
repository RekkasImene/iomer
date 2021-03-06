part of 'ot_bloc.dart';

@immutable
abstract class OtState {
  const OtState();

  List<Object> get props => [];
}

class OtInitial extends OtState {}

class OtLoading extends OtState {}

class OtLoaded extends OtState {
  final List<Ot> ots;

  const OtLoaded(this.ots);
}

class OtError extends OtState {
  final String message;

  const OtError(this.message);
}

class OtSelected extends OtState {
  final Ot ot;

  const OtSelected(this.ot);
}

class CodeMachineLoaded extends OtState {
  final String nomMachine;

  const CodeMachineLoaded(this.nomMachine);
}
