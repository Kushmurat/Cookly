import 'dart:developer';

import 'package:cookly/src/core/clients/remote/remote_client.dart';
import 'package:cookly/src/feature/category/data/models/remote/responses/recipe_preview_remote_response.dart';

import 'i_category_remote.dart';

class CategoryRemoteImpl implements ICategoryRemote {
  CategoryRemoteImpl(this.remote);

  final RemoteClient remote;

  @override
  Future<List<RecipePreviewRemoteResponse>> getRecipesByCategory(
    String category,
  ) async {
    try {
      final String path = '/recipes/category/$category/';
      final response = await remote.get(path);
      if (response.statusCode == 200) {
        final list = response.data as List;

        final recipesList = list.map((item) {
          final recipeResponse = RecipePreviewRemoteResponse.fromJson(item);
          return recipeResponse;
        }).toList();
        return recipesList;
      }
      throw ('Error to get recipes by category $category');
    } catch (error, stackTrace) {
      log(
        'GetRecipesByCategory',
        error: error,
        stackTrace: stackTrace,
        name: 'CategoryRemoteImpl',
      );
      rethrow;
    }
  }
}
