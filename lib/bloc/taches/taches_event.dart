part of 'taches_bloc.dart';

abstract class TachesEvent extends Equatable {
  const TachesEvent();

  @override
  List<Object> get props => [];
}

class FetchTachesEvenet extends TachesEvent {}

class CheckedTachesEvenet extends TachesEvent {
  final Tache tache;

  const CheckedTachesEvenet(this.tache);
}
