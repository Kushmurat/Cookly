import 'package:cookly/src/feature/category/domain/entities/recipe_preview.dart';
import 'package:cookly/src/feature/category/domain/entities/requests/get_recipes_by_category_request.dart';
import 'package:cookly/src/feature/category/domain/use_cases/get_recipes_by_category_use_case.dart';
import 'package:flutter/cupertino.dart';

class RecipesPreviewController extends ChangeNotifier {
  RecipesPreviewController({
    required this.category,
    required this.getRecipesByCategory,
  });

  final String category;
  final GetRecipesByCategoryUseCase getRecipesByCategory;

  List<RecipePreview> get list => _list;
  List<RecipePreview> _list = [];

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  Future<void> fetch() async {
    final request = GetRecipesByCategoryRequest(category);
    _isLoading = true;
    notifyListeners();
    final list = await getRecipesByCategory.execute(request);
    _list.clear();
    _list.addAll(list);
    _isLoading = false;
    notifyListeners();
  }
}
