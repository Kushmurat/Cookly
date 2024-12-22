import 'package:cookly/src/feature/recipe/data/models/recipe_remote_response.dart';

import '../../../domain/entities/ingredient.dart';
import '../../../domain/entities/recipe.dart';
import 'ingredient_amount_response_to_entity_mapper.dart';

class RecipeResponseToEntity {
  static Recipe map(RecipeRemoteResponse from) {
    final ingredients =
        from.ingredients.map(IngredientAmountResponseToEntity.map).toList();
    return Recipe(
      id: from.id,
      name: from.name,
      category: from.category,
      cookingTime: from.cookingTime,
      calories: from.calories,
      cookingLevel: from.cookingLevel,
      description: from.description,
      preparation: from.preparation,
      ingredients: ingredients,
      image: from.image,
      isFavourite: from.isFavourite,
      inBasket: from.inBasket,
    );
  }
}
