import 'dart:developer';

import 'package:cookly/src/feature/recipe/domain/entities/recipe_preview.dart';
import 'package:cookly/src/feature/recipe/domain/entities/requests/by_category_request.dart';
import 'package:cookly/src/feature/recipe/domain/use_cases/get_recipes_by_category_use_case.dart';
import 'package:flutter/cupertino.dart';

class RecipesPreviewController extends ChangeNotifier {
  RecipesPreviewController({
    required this.category,
    required this.getRecipesByCategory,
  }) {
    fetch();
  }

  final String category;
  final GetRecipesByCategoryUseCase getRecipesByCategory;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  List<RecipePreview> get recipes => _recipes;
  final List<RecipePreview> _recipes = [];

  bool get hasError => _errorText != null;

  String? get errorText => _errorText;
  String? _errorText;

  Future<void> fetch() async {
    try {
      final request = ByCategoryRequest(category);
      _isLoading = true;
      _recipes.clear();
      notifyListeners();
      final result = await getRecipesByCategory.execute(request);
      _isLoading = false;
      _recipes.addAll(result);
      notifyListeners();
    } catch (error, stackTrace) {
      log(
        'fetch',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipesPreviewController',
      );
      _errorText = 'Error: $error';
      _isLoading = false;
      notifyListeners();
    }
  }
}
