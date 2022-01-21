part of 'workers_bloc.dart';

abstract class WorkersEvent extends Equatable {
  const WorkersEvent();

  @override
  List<Object> get props => [];
}

class FetchWorkerEvenet extends WorkersEvent {}
