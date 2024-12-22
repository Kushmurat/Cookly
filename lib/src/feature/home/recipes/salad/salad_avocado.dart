import 'package:cookly/src/app/injection.dart';
import 'package:cookly/src/feature/recipe/domain/use_cases/get_recipe_by_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../auth/presentation/widgets/recipe.widget.dart';
import '../../../recipe/presentation/recipe_controller.dart';

class AvocadoPage extends StatefulWidget {
  const AvocadoPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  State<AvocadoPage> createState() => _AvocadoPageState();
}

class _AvocadoPageState extends State<AvocadoPage> {
  late final RecipeController controller;

  @override
  void initState() {
    super.initState();
    controller = RecipeController(
      id: widget.id,
      getRecipeById: getIt<GetRecipeByIdUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final recipe = controller.recipe;
        if (recipe != null) {
          return Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.orange),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.star_border, color: Colors.orange),
                  onPressed: () {},
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          recipe.image,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Title and Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(recipe.name),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildInfoIcon(Icons.timer, '${recipe.cookingTime} мин'),
                            const SizedBox(width: 48),
                            buildInfoIcon(Icons.local_fire_department, '${recipe.calories} ккал'),
                            const SizedBox(width: 42),
                            buildInfoIcon(Icons.dining, recipe.cookingLevel),
                          ],
                        ),

                        const SizedBox(height: 16),
                        Text(
                          'Описание',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          recipe.description,
                          style: GoogleFonts.montserrat(fontSize: 13, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 16),
                        // People Counter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person, color: Colors.grey),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.orange),
                              onPressed: () {},
                            ),
                            const Text(
                              '1',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, color: Colors.orange),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Ingredientы
                        const SizedBox(height: 8),
                        buildIngredientsList(recipe.ingredients),
                        const SizedBox(height: 16),
                        // Add to Cart Button
                        const SizedBox(height: 8),
                        // Preparation Steps
                        buildPreparationSteps(recipe.preparation),
                        const SizedBox(height: 16),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(
          child: Text(controller.errorText ?? ' Some error'),
        );
      },
    );
  }
}
