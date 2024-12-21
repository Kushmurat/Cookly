import 'dart:developer';

import 'package:cookly/src/feature/category/data/data_sources/remote/i_category_remote.dart';
import 'package:cookly/src/feature/category/domain/entities/recipe_preview.dart';
import 'package:cookly/src/feature/category/domain/entities/requests/get_recipes_by_category_request.dart';
import 'package:cookly/src/feature/category/domain/repositories/i_category_repository.dart';

class CategoryRepositoryImpl implements ICategoryRepository {
  CategoryRepositoryImpl(this.remote);

  final ICategoryRemote remote;

  @override
  Future<List<RecipePreview>> getRecipesByCategory(
    GetRecipesByCategoryRequest request,
  ) async {
    try {
      final category = request.category;
      final response = await remote.getRecipesByCategory(category);

      return response.map((item) {
        return RecipePreview(
          id: item.id,
          name: item.name,
          image: item.image,
          cookingTime: item.cookingTime,
          isFavorite: item.isFavorite,
        );
      }).toList();
    } catch (error, stackTrace) {
      log(
        'getRecipesByCategory',
        error: error,
        stackTrace: stackTrace,
        name: 'CategoryRepositoryImpl',
      );
      rethrow;
    }
  }
}
