part of 'ot_bloc.dart';

///Cette classe contient tous les evenements lié à l'UI [machine]
@immutable
abstract class OtEvent extends Equatable {
  const OtEvent();

  @override
  List<Object> get props => [];
}

class FetchEventOt extends OtEvent {
  Equipement? equipement;

  FetchEventOt(this.equipement);
}

class NewEventOt extends OtEvent {
  final String codeMachine;
  final Categorie categorie;

  const NewEventOt(this.categorie, this.codeMachine);
}

class CodeEventMachine extends OtEvent {
  final String codeEquipement;

  const CodeEventMachine(this.codeEquipement);
}

class SetEventOt extends OtEvent {
  final Ot ot;

  const SetEventOt(this.ot);
}

class SelectEventOt extends OtEvent {}

class SetOpenOt extends OtEvent{
  final DateTime openDate;
  const SetOpenOt(this.openDate);

}
