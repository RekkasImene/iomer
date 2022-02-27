part of 'cloture_bloc.dart';

@immutable
abstract class ClotureEvent extends Equatable {
const ClotureEvent();

@override
List<Object> get props => [];
}

class GetOtOpenTime extends ClotureEvent {}




class SetCloseOt extends ClotureEvent {
  final DateTime otCloseTime;

  const SetCloseOt(this.otCloseTime);
}