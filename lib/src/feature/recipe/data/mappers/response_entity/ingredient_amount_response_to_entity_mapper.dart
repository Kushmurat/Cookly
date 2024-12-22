import 'package:cookly/src/feature/recipe/domain/entities/ingredient_amount.dart';

import '../../models/ingredient_amount_remote_response.dart';
import 'ingredient_response_to_entity_mapper.dart';

class IngredientAmountResponseToEntity {
 static IngredientAmount map(IngredientAmountRemoteResponse from) {
    return IngredientAmount(
      amount: from.amount,
      ingredient: IngredientResponseToEntity.map(from.ingredient),
    );
  }
}
