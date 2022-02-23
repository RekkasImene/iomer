part of 'parts_bloc.dart';

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

  UpdateEventListParts(this.listreservation, this.controller);
}

class AddPieceEventParts extends PartsEvent {
  final String piece;

  AddPieceEventParts(this.piece);
}

class InternetEventParts extends PartsEvent {}


