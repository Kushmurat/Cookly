import 'package:cookly/src/feature/recipe/data/models/ingredient_amount_remote_response.dart';

class RecipeRemoteResponse {
  final int id;
  final String name;
  final String category;
  final int cookingTime;
  final int calories;
  final String cookingLevel;
  final String description;
  final String preparation;
  final List<IngredientAmountRemoteResponse> ingredients;
  final String image;
  final bool isFavourite;
  final bool inBasket;

  RecipeRemoteResponse({
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

  factory RecipeRemoteResponse.fromJson(Map<String, dynamic> json) {
    final ingredientsFromJson = json['ingredients'] as List;
    final ingredients = ingredientsFromJson.map((json) {
      return IngredientAmountRemoteResponse.fromJson(json);
    }).toList();

    return RecipeRemoteResponse(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      cookingTime: json['cooking_time'],
      calories: json['calories'],
      cookingLevel: json['cooking_level'],
      description: json['description'],
      preparation: json['preparation'],
      ingredients: ingredients,
      image: json['image'],
      isFavourite: json['is_favourite'],
      inBasket: json['in_basket'],
    );
  }
}
