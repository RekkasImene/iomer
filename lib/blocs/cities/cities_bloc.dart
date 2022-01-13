import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial()) {
    on<CitiesEvent>((event, emit) {
      //TODO: a remplacer avec données
      final List<String> _cities = [
        "Lille",
        "Paris",
        "st germain",
        "Marseille",
        "Lyon",
        "Toulouse",
        "St lazare",
        "Rouen",
        "Chalons"
      ];
      if (event is GetCities) {
        emit(const GetCitiesLoading());
        // TODO: get cities from backend.
        // final result = await .....; récupéré les villes
        if (_cities.isNotEmpty) {
          emit(GetCitiesSuccess(_cities));
        } else {
          emit(const GetCitiesFailure('Error getting cities'));
        }
      }
    });
  }
}
