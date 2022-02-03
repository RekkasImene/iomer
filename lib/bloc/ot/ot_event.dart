part of 'ot_bloc.dart';

@immutable
abstract class OtEvent extends Equatable {
  const OtEvent();

  @override
  List<Object> get props => [];
}

class FetchEventOt extends OtEvent {}


class NewEventOt extends OtEvent {
  final int numero;
  NewEventOt(this.numero);
}

class SetEventOt extends OtEvent{
  final Ot ot;
  SetEventOt(this.ot);
}

class SelectEventOt extends OtEvent{}

