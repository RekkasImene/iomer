part of 'cloture_bloc.dart';

@immutable
abstract class ClotureState extends Equatable {
const ClotureState();

@override
List<Object> get props => [];
}

class ClotureInitial extends ClotureState {}
class StateDurationOt extends ClotureState {
  var duree;
 StateDurationOt(this.duree);
}