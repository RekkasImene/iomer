part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesInitial extends CitiesState {
  @override
  List<Object> get props => [];
}

class CitiesLoading extends CitiesState {
  const CitiesLoading();
}

class CitiesLoaded extends CitiesState {
  final List listsite;
  const CitiesLoaded(this.listsite);
}


class GetCitiesFailure extends CitiesState {
  final String error;

  const GetCitiesFailure(this.error);

  @override
  List<Object> get props => [error];
}

class CitiesError extends CitiesState {
  final String message;
  const CitiesError(this.message);
}
