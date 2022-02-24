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
  const SitesLoaded(this.sites);
}

class SitesError extends SitesState {
  final String message;

  const SitesError(this.message);
}

class FormFilled extends SitesState {
  final Site site;

  const FormFilled(this.site);
}

class SitesReload extends SitesState {}

class NavigationState extends SitesState {}
