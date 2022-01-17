part of 'sites_bloc.dart';

@immutable
abstract class SitesState {
  const SitesState();

  @override
  List<Object> get props => [];
}

class SitesInitial extends SitesState {}

class SitesLoading extends SitesState {}

class SitesLoaded extends SitesState {
  final List<Site> sites;
  SitesLoaded(this.sites);
}

class SitesError extends SitesState {
  final String message;
  SitesError(this.message);
}
