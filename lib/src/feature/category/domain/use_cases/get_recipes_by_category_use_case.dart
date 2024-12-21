import 'package:cookly/src/feature/category/domain/entities/recipe_preview.dart';
import 'package:cookly/src/feature/category/domain/entities/requests/get_recipes_by_category_request.dart';
import 'package:cookly/src/feature/category/domain/repositories/i_category_repository.dart';

class GetRecipesByCategoryUseCase {
  GetRecipesByCategoryUseCase(this.repository);

  final ICategoryRepository repository;

  Future<List<RecipePreview>> execute(GetRecipesByCategoryRequest request) {
    return repository.getRecipesByCategory(request);
  }
}
