part of 'ot_bloc.dart';

@immutable
abstract class OtEvent extends Equatable {
  const OtEvent();

  @override
  List<Object> get props => [];
}

class FetchEventOt extends OtEvent {}

class FetchEventCategorie extends OtEvent {}

class NewEventOt extends OtEvent {
  final Categorie categorie;
  NewEventOt(this.categorie);
}