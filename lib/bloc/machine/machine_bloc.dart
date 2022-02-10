import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'machine_event.dart';
part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  MachineBloc() : super(MachineInitial()) {
    on<MachineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
