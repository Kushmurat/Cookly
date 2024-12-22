import 'ingredient_remote_response.dart';

class IngredientAmountRemoteResponse {
  final String amount;
  final IngredientRemoteResponse ingredient;

  IngredientAmountRemoteResponse({
    required this.amount,
    required this.ingredient,
  });

  factory IngredientAmountRemoteResponse.fromJson(Map<String, dynamic> json) {
    return IngredientAmountRemoteResponse(
      amount: json['amount'],
      ingredient: IngredientRemoteResponse.fromJson(json['ingredient']),
    );
  }
}
