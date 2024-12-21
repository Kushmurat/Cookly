import 'package:cookly/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../feature/category/presentation/widgets/resipes_preview_screen.dart';
import '../feature/menu/menu_kategory_page/breakfast_page.dart';
import '../feature/menu/menu_kategory_page/dessert_page.dart';
import '../feature/menu/menu_kategory_page/dinner_page.dart';
import '../feature/menu/menu_kategory_page/lunch_page.dart';
import '../feature/menu/menu_kategory_page/salad_page.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'image': 'assets/images/ic_breakfast.png',
        'label': 'Завтрак',
        'page': RecipesPreviewScreen(
          category: 'breakfast',
          getRecipesByCategory: context.read(),
        ),
      },
      {
        'image': 'assets/images/ic_lunch.png',
        'label': 'Обед',
        'page': LunchPage(),
      },
      {
        'image': 'assets/images/ic_dinner.png',
        'label': 'Ужин',
        'page': DinnerPage(),
      },
      {
        'image': 'assets/images/ic_dessert.png',
        'label': 'Десерты',
        'page': DessertPage(),
      },
      {
        'image': 'assets/images/ic_salad.png',
        'label': 'Салаты',
        'page': SaladPage(),
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
