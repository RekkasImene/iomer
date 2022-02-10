part of 'machine_bloc.dart';

abstract class MachineState extends Equatable {
  const MachineState();
  
  @override
  List<Object> get props => [];
}

class MachineInitial extends MachineState {}
