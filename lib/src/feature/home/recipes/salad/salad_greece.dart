import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../services/api_recipe_service.dart';
import '../../../recipe/data/models/recipe.dart';
import '../models/recipe_model.dart';
import '../services/recipe_service.dart';

class GreecePage extends StatefulWidget {
  const GreecePage({Key? key}) : super(key: key);

  @override
  State<GreecePage> createState() => _GreecePageState();
}

class _GreecePageState extends State<GreecePage> {
  late Future<Recipe> _recipeFuture;
  final RecipeService _service = RecipeService();

  @override
  void initState() {
    super.initState();
    _recipeFuture = _service.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Греческий салат'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<Recipe>(
        future: _recipeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final recipe = snapshot.data!;
            return _buildRecipeContent(recipe);
          } else {
            return const Center(child: Text('Рецепт не найден.'));
          }
        },
      ),
    );
  }

  Widget _buildRecipeContent(Recipe recipe) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(recipe.imageUrl, height: 250, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.title,
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(recipe.description),
                const SizedBox(height: 16),
                Text('Ингредиенты',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                ...recipe.ingredients.map(
                      (ingredient) => ListTile(
                    title: Text(ingredient.name),
                    trailing: Text(ingredient.amount),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Шаги приготовления',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                ...recipe.steps.map(
                      (step) => ListTile(
                    title: Text(step.title),
                    subtitle: Text(step.description),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
