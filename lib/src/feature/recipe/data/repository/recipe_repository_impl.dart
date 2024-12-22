import 'dart:developer';

import 'package:cookly/src/feature/recipe/data/data_sourses/remote/i_recipe_remote.dart';
import 'package:cookly/src/feature/recipe/data/mappers/response_entity/recipe_response_to_entity_mapper.dart';
import 'package:cookly/src/feature/recipe/domain/entities/recipe.dart';
import 'package:cookly/src/feature/recipe/domain/entities/recipe_preview.dart';
import 'package:cookly/src/feature/recipe/domain/entities/requests/by_category_request.dart';
import 'package:cookly/src/feature/recipe/domain/entities/requests/by_id_request.dart';

import '../../domain/repositories/i_recipe_repository.dart';

class RecipeRepositoryImpl implements IRecipeRepository {
  RecipeRepositoryImpl(this.remote);

  final IRecipeRemote remote;

  @override
  Future<Recipe> getRecipeById(ByIdRequest request) async {
    try {
      final id = request.id;
      final response = await remote.getRecipeById(id);
      final result = RecipeResponseToEntity.map(response);
      return result;
    } catch (error, stackTrace) {
      log(
        'GetRecipeById: ${request.id}',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipeRepositoryImpl',
      );
      rethrow;
    }
  }

  @override
  Future<List<RecipePreview>> getRecipePreviewByCategory(
      ByCategoryRequest request) async {
    try {
      final category = request.category;
      final response = await remote.getRecipePreviewByCategory(category);
      final result = response.map((item) {
        return RecipePreview(
          id: item.id,
          name: item.name,
          image: item.image,
          cookingTime: item.cookingTime,
          isFavorite: item.isFavorite,);
      }).toList();
      return result;
    } catch (error, stackTrace) {
      log(
        'getRecipePreviewByCategory: ${request.category}',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipeRepositoryImpl',
      );
      rethrow;
    }
  }
}
