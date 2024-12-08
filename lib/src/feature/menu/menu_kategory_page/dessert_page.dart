import 'package:flutter/material.dart';

import '../../home/recipes/desert/cake.dart';
import '../../home/recipes/desert/cheesecake.dart';
import '../../home/recipes/desert/dessert_cookie.dart';
import '../../home/recipes/desert/tiramisu.dart';
import '../../home/recipes/desert/trifle.dart';
import '../../home/recipes/desert/waffles.dart';

class DessertPage extends StatelessWidget {
  const DessertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Дессерты",
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
    {'title': 'Печенье с шоколадом', 'time': '30 мин', 'image': 'assets/images/dessert_cookie.png'},
    {'title': 'Тирамису', 'time': '30 мин', 'image': 'assets/images/dessert_tiramisu.png'},
    {'title': 'Банановый трайфл', 'time': '30 мин', 'image': 'assets/images/dessert_trifle.png'},
    {'title': 'Шоколадные вафли', 'time': '35 мин', 'image': 'assets/images/dessert_waffles.png'},
    {'title': 'Шоколадный чизкейк с вишней', 'time': '30 мин', 'image': 'assets/images/dessert_cheesecake.png'},
    {'title': 'Вишневый пирог', 'time': '30 мин', 'image': 'assets/images/dessert_cake.png'},
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
      if (title == 'Печенье с шоколадом') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const CookiePage()),
        );
      } else if (title == 'Тирамису') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TiramisuPage()),
        );
      } else if (title == 'Банановый трайфл') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TriflePage()),
        );
      } else if (title == 'Шоколадные вафли') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WafflesPage()),
        );
      } else if (title == 'Шоколадный чизкейк с вишней') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CheeseCakePage()),
        );
      } else if (title == 'Вишневый пирог') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CherryCakePage()),
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
