import 'package:flutter/material.dart';

import '../../home/recipes/ breakfast/american_breakfast.dart';
import '../../home/recipes/ breakfast/avocado_toast.dart';
import '../../home/recipes/ breakfast/egg_quesadilla.dart';
import '../../home/recipes/ breakfast/kasha.dart';
import '../../home/recipes/ breakfast/shakshuka.dart';
import '../../home/recipes/ breakfast/syrniki.dart';
import '../../recipe/presentation/recipe_screen.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Завтрак",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Найти рецепт',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Recipes(cardWidth: 165, cardHeight: 170),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget Recipes({required double cardWidth, required double cardHeight}) {
  final recipes = [
    {
      'title': 'Кесадилья с яйцом',
      'time': '10 мин',
      'image': 'assets/images/breakfast_kesadilya.png'
    },
    {
      'title': 'Американский завтрак',
      'time': '10 мин',
      'image': 'assets/images/breakfast_american.png'
    },
    {
      'title': 'Авокадо - тост',
      'time': '10 мин',
      'image': 'assets/images/breakfast_tosts.png'
    },
    {
      'title': 'Сырники из творога',
      'time': '15 мин',
      'image': 'assets/images/breakfast_pancakes.png'
    },
    {
      'title': 'Овсяная каша на молоке',
      'time': '10 мин',
      'image': 'assets/images/breakfast_kasha.png'
    },
    {
      'title': 'Шакшука',
      'time': '20 мин',
      'image': 'assets/images/breakfast_shakshuka.png'
    },
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .size
                  .width /
              cardWidth)
          .floor(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: cardWidth / cardHeight,
    ),
    itemCount: recipes.length,
    itemBuilder: (BuildContext context, int index) {
      final recipe = recipes[index];
      return _buildRecipeCard(recipe['title']!, recipe['time']!,
          recipe['image']!, cardWidth, cardHeight, context);
    },
  );
}

Widget _buildRecipeCard(String title, String time, String image, double width,
    double height, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Настраиваем переход для каждой карточки
      if (title == 'Кесадилья с яйцом') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(
              id: 1,
            ),
          ),
        );
      } else if (title == 'Американский завтрак') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AmericanBreakfastPage()),
        );
      } else if (title == 'Авокадо - тост') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AvocadoToastPage()),
        );
      } else if (title == 'Сырники из творога') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SyrnikiPage()),
        );
      } else if (title == 'Овсяная каша на молоке') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KashaPage()),
        );
      } else if (title == 'Шакшука') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShakshukaPage()),
        );
      }
    },
    child: Container(
      width: width,
      height: height,
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
          image: AssetImage(image),
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
                title,
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
                  time,
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
