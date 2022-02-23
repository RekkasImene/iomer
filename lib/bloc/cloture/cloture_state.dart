part of 'cloture_bloc.dart';

@immutable
abstract class ClotureState extends Equatable {
const ClotureState();

@override
List<Object> get props => [];
}

class ClotureInitial extends ClotureState {}
class StateDurationOt extends ClotureState {
  final List<String> listDuration;
  const StateDurationOt(this.listDuration);
}

class ClotureError extends ClotureState {
  final String message;

  const ClotureError(this.message);
}

class ClotureEnd extends ClotureState { }