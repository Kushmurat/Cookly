import 'package:cookly/src/feature/home/recipes/lunch/lunch_roll.dart';
import 'package:cookly/src/feature/home/recipes/lunch/lunch_sparzha.dart';
import 'package:flutter/material.dart';

import '../../home/recipes/lunch/lunch_brock.dart';
import '../../home/recipes/lunch/lunch_curry.dart';
import '../../home/recipes/lunch/lunch_pasta.dart';
import '../../home/recipes/lunch/lunch_semga.dart';

class LunchPage extends StatelessWidget {
  const LunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Обед",
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
    {'title': 'Стейк из семги', 'time': '20 мин', 'image': 'assets/images/lunch_semga.png'},
    {'title': 'Бедро с брокколи', 'time': '25 мин', 'image': 'assets/images/lunch_brock.png'},
    {'title': 'Курица по азиатский со спаржей', 'time': '25 мин', 'image': 'assets/images/lunch_sparzha.png'},
    {'title': 'Ролл с курицей', 'time': '15 мин', 'image': 'assets/images/lunch_roll.png'},
    {'title': 'Кацу-карри с курицей', 'time': '25 мин', 'image': 'assets/images/lunch_curry.png'},
    {'title': 'Паста с креветками', 'time': '25 мин', 'image': 'assets/images/lunch_pasta.png'},
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
      if (title == 'Стейк из семги') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const SemgaPage()),
        );
      } else if (title == 'Бедро с брокколи') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BrockPage()),
        );
      } else if (title == 'Курица по азиатский со спаржей') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SparzhaPage()),
        );
      } else if (title == 'Ролл с курицей') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RollPage()),
        );
      } else if (title == 'Кацу-карри с курицей') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CurryPage()),
        );
      } else if (title == 'Паста с креветками') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PastaPage()),
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
