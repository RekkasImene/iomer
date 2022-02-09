part of 'ot_bloc.dart';

@immutable
abstract class OtEvent extends Equatable {
  const OtEvent();

  @override
  List<Object> get props => [];
}

class FetchEventOt extends OtEvent {
  Equipement equipement;
  FetchEventOt(this.equipement);
}

class NewEventOt extends OtEvent {
  final String codeMachine;
  final Categorie categorie;
  NewEventOt(this.categorie, this.codeMachine);

}

class CodeEventMachine extends OtEvent {
  final String codeEquipement;
  CodeEventMachine(this.codeEquipement);
}

class SetEventOt extends OtEvent{
  final Ot ot;
  SetEventOt(this.ot);
}

class SelectEventOt extends OtEvent{}

