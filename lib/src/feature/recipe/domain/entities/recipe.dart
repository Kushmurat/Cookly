
import 'ingredient_amount.dart';

class Recipe {
  final int id;
  final String name;
  final String category;
  final int cookingTime;
  final int calories;
  final String cookingLevel;
  final String description;
  final String preparation;
  final List<IngredientAmount> ingredients;
  final String image;
  final bool isFavourite;
  final bool inBasket;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.cookingTime,
    required this.calories,
    required this.cookingLevel,
    required this.description,
    required this.preparation,
    required this.ingredients,
    required this.image,
    required this.isFavourite,
    required this.inBasket,
  });


}
