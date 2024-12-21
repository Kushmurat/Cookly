import 'package:cookly/src/feature/category/domain/entities/recipe_preview.dart';

import '../entities/requests/get_recipes_by_category_request.dart';

abstract interface class ICategoryRepository {
  Future<List<RecipePreview>> getRecipesByCategory(
    GetRecipesByCategoryRequest request,
  );
}
