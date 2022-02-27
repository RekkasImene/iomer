part of 'parts_bloc.dart';

@immutable
abstract class PartsState {
  const PartsState();

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
  const PartsUpdate();
}

class PartsStateAddArticle extends PartsState {
  const PartsStateAddArticle();
}

class StatePartsInternetInterrupt extends PartsState {
  final String message;
  const StatePartsInternetInterrupt(this.message);
}

class StatePartsNoArticle extends PartsState {
  final String message;
  const StatePartsNoArticle(this.message);
}

class StatePartsInternetError extends PartsState {
  final String message;
  const StatePartsInternetError(this.message);
}

class CodePartLoaded extends PartsState{
  final String libellePart;
  const CodePartLoaded(this.libellePart);
}

class StatePartsInternetOk extends PartsState {}

class StateArticleFind extends PartsState {
  final String libelle;
  final String npiece;
  const StateArticleFind(this.libelle,this.npiece);
}
