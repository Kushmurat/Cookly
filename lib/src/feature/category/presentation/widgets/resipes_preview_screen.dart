import 'package:cookly/src/feature/category/domain/entities/recipe_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/use_cases/get_recipes_by_category_use_case.dart';
import 'recipes_preview_controller.dart';

class RecipesPreviewScreen extends StatefulWidget {
  const RecipesPreviewScreen({
    required this.category,
    required this.getRecipesByCategory,
    super.key,
  });

  final String category;
  final GetRecipesByCategoryUseCase getRecipesByCategory;

  @override
  State<RecipesPreviewScreen> createState() => _RecipesPreviewScreenState();
}

class _RecipesPreviewScreenState extends State<RecipesPreviewScreen> {
  late final RecipesPreviewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = RecipesPreviewController(
      category: widget.category,
      getRecipesByCategory: widget.getRecipesByCategory,
    );
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.category,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListenableBuilder(
          listenable: controller,
          builder: (_, __) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Найти рецепт',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(child: buildRecipes(controller.list)),
                ],
              ),
            );
          }),
    );
  }
}

Widget buildRecipes(List<RecipePreview> list) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .size
                  .width /
              165)
          .floor(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 165 / 170,
    ),
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      final recipe = list[index];
      return _buildRecipeCard(recipe);
    },
  );
}

Widget _buildRecipeCard(RecipePreview recipe) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 165,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.50),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(recipe.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            right: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              constraints: const BoxConstraints(maxWidth: 120),
              child: Text(
                recipe.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 3,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Row(
              children: [
                const Icon(Icons.timer, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  recipe.cookingTime.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
