part of 'ot_bloc.dart';

@immutable
abstract class OtState {
  const OtState();

  @override
  List<Object> get props => [];
}

class OtInitial extends OtState {}

class OtLoading extends OtState {}

class OtLoaded extends OtState {
  final List<OtData> ots;
  const OtLoaded(this.ots);
}

class OtError extends OtState {
  final String message;
  const OtError(this.message);
}