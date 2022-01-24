part of 'sites_bloc.dart';

@immutable
abstract class SitesEvent extends Equatable {
  const SitesEvent();

  @override
  List<Object> get props => [];
}

class FetchEventSites extends SitesEvent {}


