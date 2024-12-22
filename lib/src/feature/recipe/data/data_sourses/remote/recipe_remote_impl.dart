import 'dart:convert';
import 'dart:developer';

import 'package:cookly/src/core/clients/remote/remote_client.dart';
import 'package:cookly/src/feature/recipe/data/models/recipe_preview_remote_response.dart';
import 'package:cookly/src/feature/recipe/data/models/recipe_remote_response.dart';

import 'i_recipe_remote.dart';

class RecipeRemoteImpl implements IRecipeRemote {
  RecipeRemoteImpl(this.client);

  final RemoteClient client;

  @override
  Future<RecipeRemoteResponse> getRecipeById(int id) async {
    try {
      final path = '/recipes/$id/';
      final response = await client.get(path);
      if (response.statusCode == 200) {
        final json = response.data;
        final result = RecipeRemoteResponse.fromJson(json);
        return result;
      }
      throw ('Error to get recipe by id: $id');
    } catch (error, stackTrace) {
      log(
        'getRecipeById: $id',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipeRemoteImpl',
      );
      rethrow;
    }
  }

  @override
  Future<List<RecipePreviewRemoteResponse>> getRecipePreviewByCategory(String category) async {
    try {
      final path = '/recipes/category/$category/';
      final response = await client.get(path);
      if (response.statusCode == 200) {
        final list = response.data as List;
        final recipes = list.map((json)=>RecipePreviewRemoteResponse.fromJson(json)).toList();
        return recipes;
      }
      throw ('Error to get recipes by category: $category');
    } catch (error, stackTrace) {
      log(
        'getRecipePreviewByCategory: $category',
        error: error,
        stackTrace: stackTrace,
        name: 'RecipeRemoteImpl',
      );
      rethrow;
    }

  }
}
