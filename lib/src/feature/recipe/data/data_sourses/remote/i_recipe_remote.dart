import '../../models/recipe_preview_remote_response.dart';
import '../../models/recipe_remote_response.dart';

abstract interface class IRecipeRemote {
  Future<RecipeRemoteResponse> getRecipeById(int id);
  Future<List<RecipePreviewRemoteResponse>>getRecipePreviewByCategory(String category);
}
