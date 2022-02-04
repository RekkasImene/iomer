import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:meta/meta.dart';

part 'categorie_event.dart';

part 'categorie_state.dart';

@Environment(Env.prod)
@injectable
class CategorieBloc extends Bloc<CategorieEvent, CategorieState> {
  final LocalRepository _repository;

  CategorieBloc(this._repository) : super(CategorieInitial()) {
    on<CategorieEvent>((event, emit) async {
      if (event is FetchEventCategorie) {
        print("Appel FetchEventCategorie... ");
        emit((CategorieLoading()));
        final List<Categorie> categories = await _repository.getAllCategory();
        if (categories.isNotEmpty) {
          print("Categories succès...");
          emit(CategoriesLoaded(categories));
        } else {
          emit(const CategorieError('Error'));
        }
      }
    });
  }
}
