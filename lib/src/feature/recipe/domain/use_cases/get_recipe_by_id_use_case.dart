import 'package:cookly/src/feature/recipe/domain/entities/requests/by_id_request.dart';

import '../entities/recipe.dart';
import '../repositories/i_recipe_repository.dart';

class GetRecipeByIdUseCase {
  GetRecipeByIdUseCase(this.repository);

  final IRecipeRepository repository;

  Future<Recipe> execute(ByIdRequest request) {
    return repository.getRecipeById(request);
  }
}
