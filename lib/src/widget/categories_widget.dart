import 'package:flutter/material.dart';

import '../feature/menu/menu_kategory_page/breakfast_page.dart';
import '../feature/menu/menu_kategory_page/dessert_page.dart';
import '../feature/menu/menu_kategory_page/dinner_page.dart';
import '../feature/menu/menu_kategory_page/lunch_page.dart';
import '../feature/menu/menu_kategory_page/salad_page.dart';
import '../feature/recipe/presentation/recipes_preview.screen.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'image': 'assets/images/ic_breakfast.png',
        'label': 'Завтрак',
        'page': const RecipesPreviewScreen(
          title: 'BreakFast',
          category: 'breakfast',
        ),
      },
      {
        'image': 'assets/images/ic_lunch.png',
        'label': 'Обед',
        'page': const RecipesPreviewScreen(
          title: 'Lunch',
          category: 'lunch',
        ),
      },
      {
        'image': 'assets/images/ic_dinner.png',
        'label': 'Ужин',
        'page': const RecipesPreviewScreen(
          category: 'dinner',
          title: 'Dinner',
        ),
      },
      {
        'image': 'assets/images/ic_dessert.png',
        'label': 'Десерты',
        'page': const RecipesPreviewScreen(
          category: 'dessert',
          title: 'Dessert',
        ),
      },
      {
        'image': 'assets/images/ic_salad.png',
        'label': 'Салаты',
        'page': const SaladPage(),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => category['page'] as Widget,
                  ),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset(
                        category['image'] as String,
                        fit: BoxFit.cover,
                        width: 38,
                        height: 38,
                      ),
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
