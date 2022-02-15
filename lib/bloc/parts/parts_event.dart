part of 'parts_bloc.dart';

@immutable
abstract class PartsEvent extends Equatable {
  const PartsEvent();

  @override
  List<Object> get props => [];
}

class FetchEventParts extends PartsEvent {}
//class ValidateEventParts extends PartsEvent {}

class UpdateEventListParts extends PartsEvent {
  final List<Reservation> listreservation;

  UpdateEventListParts(this.listreservation);
}

class AddEventParts extends PartsEvent {
  // A remplir ...
  AddEventParts();
}
