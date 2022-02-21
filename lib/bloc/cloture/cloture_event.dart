part of 'cloture_bloc.dart';

@immutable
abstract class ClotureEvent extends Equatable {
const ClotureEvent();

@override
List<Object> get props => [];
}

class getOtOpenTime extends ClotureEvent {}

class otCloseTimeEvent extends ClotureEvent {
  final DateTime otCloseTime;

  const otCloseTimeEvent(this.otCloseTime);
}