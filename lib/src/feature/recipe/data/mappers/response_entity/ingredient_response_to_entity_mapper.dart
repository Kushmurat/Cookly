import '../../../domain/entities/ingredient.dart';
import '../../models/ingredient_remote_response.dart';

class IngredientResponseToEntity {
  static Ingredient map(IngredientRemoteResponse from) {
    return Ingredient(
      id: from.id,
      name: from.name,
      isFavourite: from.isFavourite,
      inBasket: from.inBasket,
    );
  }
}
