part of 'categorie_bloc.dart';

@immutable
abstract class CategorieState {
  const CategorieState();

  List<Object> get props => [];
}

class CategorieInitial extends CategorieState {}

class CategorieLoading extends CategorieState {}

class CategoriesLoaded extends CategorieState {
  final List<Categorie> categorie;

  const CategoriesLoaded(this.categorie);
}

class CategorieError extends CategorieState {
  final String message;

  const CategorieError(this.message);
}
