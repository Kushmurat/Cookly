import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/recipe.dart';
import '../src/feature/recipe/data/models/recipe.dart';

class RecipeService {
  final Dio _dio = Dio();

  Future<Recipe> fetchRecipes() async {
    final response = await _dio.get('https://cookly-andas-decode.vercel.app/recipes/category/salad/'); // Замените на свой URL
    if (response.statusCode == 200) {
      return Recipe.fromJson(response.data);
    } else {
      throw Exception('Ошибка загрузки рецепта: ${response.statusCode}');
    }
  }
}
