part of 'parts_bloc.dart';

///Cette classe contient tous les evenements lié à l'UI [parts]
@immutable
abstract class PartsEvent extends Equatable {
  const PartsEvent();

  @override
  List<Object> get props => [];
}

class CodeEventPart extends PartsEvent {
  final String codePart;

  const CodeEventPart(this.codePart);
}

class FetchEventParts extends PartsEvent {}

class UpdateEventListParts extends PartsEvent {
  final List<Reservation> listreservation;
  final List<TextEditingController> controller;

  const UpdateEventListParts(this.listreservation, this.controller);
}

class AddPieceEventParts extends PartsEvent {
  final String piece;
  final String libelle;
  final String qte;

  const AddPieceEventParts(this.piece, this.libelle, this.qte);
}

class InternetEventParts extends PartsEvent {}


