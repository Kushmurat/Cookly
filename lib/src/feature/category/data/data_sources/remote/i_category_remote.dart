import 'package:cookly/src/feature/category/data/models/remote/responses/recipe_preview_remote_response.dart';

abstract interface class ICategoryRemote {
  Future<List<RecipePreviewRemoteResponse>> getRecipesByCategory(
    String category,
  );
}
