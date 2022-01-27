part of 'matricule_bloc.dart';

abstract class MatriculeEvent extends Equatable {
  const MatriculeEvent();

  @override
  List<Object> get props => [];
}

class FetchMatriculeEvent extends MatriculeEvent {}
