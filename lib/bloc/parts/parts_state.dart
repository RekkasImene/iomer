part of 'parts_bloc.dart';

@immutable
abstract class PartsState {
  const PartsState();

  @override
  List<Object> get props => [];
}

class PartsInitial extends PartsState {}

class PartsLoading extends PartsState {}

class PartsLoaded extends PartsState {
  final List<Reservation> reservation;

  const PartsLoaded(this.reservation);
}

class PartsError extends PartsState {
  final String message;

  const PartsError(this.message);
}

class PartsUpdate extends PartsState {
  PartsUpdate();
}

class PartsStateAddArticle extends PartsState {
  PartsStateAddArticle();
}

class StatePartsInternetInterrupt extends PartsState {
  String message;
  StatePartsInternetInterrupt(this.message);
}

class StatePartsNoArticle extends PartsState {
  String message;
  StatePartsNoArticle(this.message);
}

class StatePartsInternetError extends PartsState {
  String message;
  StatePartsInternetError(this.message);
}

class StatePartsInternetOk extends PartsState {}



