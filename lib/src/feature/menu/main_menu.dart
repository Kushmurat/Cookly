import 'package:cookly/src/feature/auth/presentation/widgets/app_icon.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cookly/src/feature/auth/presentation/widgets/app_icon.widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/categories_widget.dart';
import '../home/navigation/home_navigation_config.dart';

class MainMenu extends StatelessWidget {
  const MainMenu ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: ListView(
          children: [
            _buildGreetingSection(),
            const SizedBox(height: 28),
            _buildRecipeOfTheDay(),
            const SizedBox(height: 28),
            _buildSearchBar(),
            const SizedBox(height: 28),
            CategoriesWidget(),
            const SizedBox(height: 29),
            _buildPopularRecipes(),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return const Text(
      'Приветствуем Имя!',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildRecipeOfTheDay() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/backgraundmenu.png'), // Укажите путь к изображению
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Рецепт дня',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Нежный и ароматный яблочный пирог, символ домашнего уюта',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {

              },
            child: const Text('Приготовить',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(

              backgroundColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Поиск',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.filter_alt),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Популярные рецепты',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Посмотреть все',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 9,
                ),
              ),
            ),
          ],
        ),
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
}
