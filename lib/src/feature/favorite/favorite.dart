import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Избранное", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Цвет кнопки "назад"

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPopularRecipes(),
          ],
        ),
      ),
    );
  }
}


Widget _buildPopularRecipes() {
  final recipes = [
    {'title': 'Цезарь с курицей', 'time': '25 мин', 'image': 'assets/images/salat.png'},
    {'title': 'Название', 'time': '30 мин', 'image': 'assets/images/fish.png'},
    {'title': 'Название', 'time': '30 мин', 'image': 'assets/images/pizza.png'},
    {'title': 'Название', 'time': '30 мин', 'image': 'assets/images/shakshuke.png'},
    {'title': 'Название', 'time': '30 мин', 'image': 'assets/images/bleny.png'},
    {'title': 'Название', 'time': '30 мин', 'image': 'assets/images/lapsha.png'},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          final recipe = recipes[index];
          return _buildRecipeCard(
            recipe['title']!,
            recipe['time']!,
            recipe['image']!,
          );
        },
      ),
    ],
  );
}
Widget _buildRecipeCard(String title, String time, String image) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
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
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
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


