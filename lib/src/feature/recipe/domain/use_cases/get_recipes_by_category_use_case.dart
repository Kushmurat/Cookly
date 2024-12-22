import 'package:cookly/src/feature/recipe/domain/entities/requests/by_category_request.dart';

import '../entities/recipe.dart';
import '../entities/recipe_preview.dart';
import '../repositories/i_recipe_repository.dart';

class GetRecipesByCategoryUseCase {
  GetRecipesByCategoryUseCase(this.repository);

  final IRecipeRepository repository;

  Future<List<RecipePreview>> execute(ByCategoryRequest request) {
    return repository.getRecipePreviewByCategory(request);
  }
}
