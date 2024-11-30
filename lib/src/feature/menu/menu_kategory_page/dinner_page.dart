import 'package:flutter/material.dart';

class DinnerPage extends StatelessWidget {
  const DinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Ужин",
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
    {'title': 'Жареный тофу с рисом', 'time': '30 мин', 'image': 'assets/images/dinner_tofu.png'},
    {'title': 'Гуйру лагман', 'time': '40 мин', 'image': 'assets/images/dinner_nail.png'},
    {'title': 'Булгур с курицей и овощами', 'time': '25 мин', 'image': 'assets/images/dinner_bulgur.png'},
    {'title': 'Паста со шпинатом и ветчиной', 'time': '30 мин', 'image': 'assets/images/dinner_spinach.png'},
    {'title': 'Гуляш из говядины', 'time': '25 мин', 'image': 'assets/images/dinner_gulyash.png'},
    {'title': 'Чечевичный крем-суп', 'time': '30 мин', 'image': 'assets/images/dinner_soup.png'},
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
      );
    },
  );
}

Widget _buildRecipeCard(String title, String time, String image, double width, double height) {
  return Container(
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
            decoration: BoxDecoration(
            ),
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
  );
}
