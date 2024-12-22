import 'dart:developer';

import 'package:cookly/src/feature/recipe/domain/entities/recipe.dart';
import 'package:cookly/src/feature/recipe/domain/entities/requests/by_id_request.dart';
import 'package:cookly/src/feature/recipe/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:flutter/cupertino.dart';

class RecipeController extends ChangeNotifier {
  RecipeController({
    required this.id,
    required this.getRecipeById,
  }) {
    fetch();
  }

  final int id;
  final GetRecipeByIdUseCase getRecipeById;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  Recipe? get recipe => _recipe;
  Recipe? _recipe;

  bool get hasError => _errorText != null;

  String? get errorText => _errorText;
  String? _errorText;

  Future<void> fetch() async {
    try {
      final request = ByIdRequest(id);
      _isLoading = true;
      notifyListeners();
      final result = await getRecipeById.execute(request);
      _isLoading = false;
      _recipe = result;
      notifyListeners();
    } catch (error, stackTrace) {
      log(
        'fetch',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipeController',
      );
      _errorText = 'Error: $error';
      _isLoading = false;
      notifyListeners();
    }
  }
}
