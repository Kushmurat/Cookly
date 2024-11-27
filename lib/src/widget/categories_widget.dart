import 'package:flutter/material.dart';
import '../feature/menu/menu_kategory_page/breakfast_page.dart';
import '../feature/menu/menu_kategory_page/dessert_page.dart';
import '../feature/menu/menu_kategory_page/dinner_page.dart';
import '../feature/menu/menu_kategory_page/lunch_page.dart';
import '../feature/menu/menu_kategory_page/salad_page.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'icon': Icons.breakfast_dining,
        'label': 'Завтрак',
        'page': BreakfastPage(), // Страница для "Завтрак"
      },
      {
        'icon': Icons.lunch_dining,
        'label': 'Обед',
        'page': LunchPage(), // Страница для "Обед"
      },
      {
        'icon': Icons.dinner_dining,
        'label': 'Ужин',
        'page': DinnerPage(), // Страница для "Ужин"
      },
      {
        'icon': Icons.cake,
        'label': 'Десерты',
        'page': DessertPage(), // Страница для "Десерты"
      },
      {
        'icon': Icons.soup_kitchen,
        'label': 'Салаты',
        'page': SaladPage(), // Страница для "Салаты"
      },
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
        const SizedBox(height: 12),
        Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: IconButton(
                      icon: Icon(category['icon'] as IconData),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            category['page'] as Widget,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category['label'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}



