part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class GetCities extends CitiesEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}