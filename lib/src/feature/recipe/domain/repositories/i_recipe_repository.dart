
import 'package:cookly/src/feature/recipe/domain/entities/requests/by_category_request.dart';

import '../entities/recipe.dart';
import '../entities/recipe_preview.dart';
import '../entities/requests/by_id_request.dart';

abstract interface class IRecipeRepository {
  Future<Recipe> getRecipeById(ByIdRequest request);
  Future<List<RecipePreview>>getRecipePreviewByCategory(ByCategoryRequest request);
}
