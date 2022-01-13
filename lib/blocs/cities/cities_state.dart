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

class GetCitiesLoading extends CitiesState {
  const GetCitiesLoading();

  @override
  List<Object> get props => [];
}

class GetCitiesSuccess extends CitiesState {
  final List<String> cities;

  const GetCitiesSuccess(this.cities);

  @override
  List<Object> get props => [cities];
}

class GetCitiesFailure extends CitiesState {
  final String error;

  const GetCitiesFailure(this.error);

  @override
  List<Object> get props => [error];
}
