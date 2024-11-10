import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildGreetingSection(),
            const SizedBox(height: 16),
            _buildRecipeOfTheDay(),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildCategories(),
            const SizedBox(height: 16),
            _buildPopularRecipes(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
          image: AssetImage('assets/backgraundmenu.png'), // Укажите путь к изображению
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
            onPressed: () {},
            child: const Text('Приготовить'),
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

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.breakfast_dining, 'label': 'Завтрак'},
      {'icon': Icons.lunch_dining, 'label': 'Обед'},
      {'icon': Icons.dinner_dining, 'label': 'Ужин'},
      {'icon': Icons.cake, 'label': 'Десерты'},
      {'icon': Icons.soup_kitchen, 'label': 'Салаты'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Категории',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: Icon(category['icon'] as IconData, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(category['label'] as String),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPopularRecipes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Популярные рецепты',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Посмотреть все'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            _buildRecipeCard('Цезарь с курицей', '25 мин', 'assets/salat.png'),
            const SizedBox(height: 8),
            _buildRecipeCard('Название', '30 мин', 'assets/fish.png'),
            const SizedBox(height: 8),
            _buildRecipeCard('Название', '30 мин', 'assets/pizza.png'),
            const SizedBox(height: 8),
            _buildRecipeCard('Название', '30 мин', 'assets/shakshuke.png'),
            const SizedBox(height: 8),
            _buildRecipeCard('Название', '30 мин', 'assets/bleny.png'),
            const SizedBox(height: 8),
            _buildRecipeCard('Название', '30 мин', 'assets/lapsha.png'),

          ],
        ),
      ],
    );
  }

  Widget _buildRecipeCard(String title, String time, String image) {
    return SizedBox(
      child: Container(
        height: 216,
        width: 165,
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
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Избранное'),
        BottomNavigationBarItem(icon: Icon(Icons.assistant), label: 'Ассистент'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Магазин'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
    );
  }
}
