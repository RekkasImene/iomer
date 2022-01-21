import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ot_event.dart';
part 'ot_state.dart';

class OtBloc extends Bloc<OtEvent, OtState> {
  OtBloc() : super(OtInitial()) {
    on<OtEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
