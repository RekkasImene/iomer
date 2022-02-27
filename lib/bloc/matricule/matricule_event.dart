part of 'matricule_bloc.dart';

///Cette classe contient tous les évenements liés à la l'Ui [matricule]
abstract class MatriculeEvent extends Equatable {
  const MatriculeEvent();

  @override
  List<Object> get props => [];
}

class FetchMatriculeEvenet extends MatriculeEvent {}

class CheckedMatriculeEvenet extends MatriculeEvent {
  final Matricule matricule;

  const CheckedMatriculeEvenet(this.matricule);
}
