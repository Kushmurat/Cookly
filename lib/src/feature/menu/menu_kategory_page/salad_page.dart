import 'package:flutter/material.dart';

import '../../home/recipes/salad/salad_avocado.dart';
import '../../home/recipes/salad/salad_caesar.dart';
import '../../home/recipes/salad/salad_greece.dart';
import '../../home/recipes/salad/salad_gruzin.dart';
import '../../home/recipes/salad/salad_hurma.dart';
import '../../home/recipes/salad/salad_strawberry.dart';

class SaladPage extends StatelessWidget {
  const SaladPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Салаты",
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
    {'title': 'Салат Цезарь с Курицей', 'time': '10 мин', 'image': 'assets/images/salad_caesar.png'},
    {'title': 'Салат с Клубникой и Шпинатом', 'time': '10 мин', 'image': 'assets/images/salad_strawberry.png'},
    {'title': 'Греческий салат', 'time': '10 мин', 'image': 'assets/images/salad_greece.png'},
    {'title': 'Салат с Авокадо и Грейпфрутом', 'time': '15 мин', 'image': 'assets/images/salad_avocado.png'},
    {'title': 'Салат грузинский с баклажанами', 'time': '10 мин', 'image': 'assets/images/salad_gruzin.png'},
    {'title': 'Салат с хурмой и сыром', 'time': '20 мин', 'image': 'assets/images/salad_hurma.png'},
  ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width / cardWidth).floor(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: cardWidth / cardHeight,
    ),
    itemCount: recipes.length,
    itemBuilder: (BuildContext context, int index) {
      final recipe = recipes[index];
      return _buildRecipeCard(
          recipe['title']!,
          recipe['time']!,
          recipe['image']!,
          cardWidth,
          cardHeight,
          context
      );
    },
  );
}

Widget _buildRecipeCard(String title, String time, String image, double width, double height, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Настраиваем переход для каждой карточки
      if (title == 'Салат Цезарь с Курицей') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const CaesarPage()),
        );
      } else if (title == 'Салат с Клубникой и Шпинатом') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StrawberryPage()),
        );
      } else if (title == 'Греческий салат') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GreecePage()),
        );
      } else if (title == 'Салат с Авокадо и Грейпфрутом') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AvocadoPage()),
        );
      } else if (title == 'Салат грузинский с баклажанами') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GruzinPage()),
        );
      } else if (title == 'Салат с хурмой и сыром') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HurmaPage()),
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
