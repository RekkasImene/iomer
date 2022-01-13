import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'site_event.dart';
part 'site_state.dart';

class SiteBloc extends Bloc<SiteEvent, SiteState> {
  SiteBloc() : super(SiteInitial()) {
    on<SiteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
