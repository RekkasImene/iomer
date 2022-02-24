part of 'sites_bloc.dart';

@immutable

///Cette classe contient tous les évenements liés à la l'Ui [home]
abstract class SitesEvent extends Equatable {
  const SitesEvent();

  @override
  List<Object> get props => [];
}

class FetchEventSites extends SitesEvent {}

class ValidateEventSites extends SitesEvent {
  final Site monsite;
  final String macategorie;

  ValidateEventSites(this.monsite, this.macategorie);
}
