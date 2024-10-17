// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ex/core/categories_bloc/category_event.dart';
import 'package:flutter_bloc_ex/core/categories_bloc/category_state.dart';
import 'package:flutter_bloc_ex/infrastructure/categories_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryStates> {
  CategoryBloc() : super(InitialState());

  Future<void> fetchCategories() async {
    try {
      emit(
        CategoryStates(
          categoriesList: [],
        ),
      );

      final categoriesList = await CategoryRepository().fetchCategories();

      emit(
        CategoryStates(
          categoriesList: categoriesList,
        ),
      );
    } catch (e) {
      emit(
        CategoryStates(
          categoriesList: [],
        ),
      );
    }
  }
}
