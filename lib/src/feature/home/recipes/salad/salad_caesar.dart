import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaesarPage extends StatelessWidget {
  const CaesarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star_border, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/salad_greece.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Title and Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Греческий салат',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInfoIcon(Icons.timer, '15 мин'),
                      const SizedBox(width: 48),
                      _buildInfoIcon(Icons.local_fire_department, 'Ккал 200'),
                      const SizedBox(width: 42),
                      _buildInfoIcon(Icons.dining, 'Легкая'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Описание',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Свежий и яркий салат с сочными помидорами, хрустящими огурцами, '
                        'сладким перцем, красным луком и солеными маслинами, украшенный кубиками феты и '
                        'заправленный оливковым маслом и лимонным соком.',
                    style: GoogleFonts.montserrat(fontSize: 13, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  // People Counter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, color: Colors.grey),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.orange),
                        onPressed: () {},
                      ),
                      const Text(
                        '1',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: Colors.orange),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Ingredients
                  const SizedBox(height: 8),
                  _buildIngredientsList(),
                  const SizedBox(height: 16),
                  // Add to Cart Button
                  const SizedBox(height: 8),
                  // Preparation Steps
                  _buildPreparationSteps(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildIngredientsList() {
    final List<Map<String, String>> ingredients = [
      {'name': 'Помидоры', 'amount': '200 г'},
      {'name': 'Огурцы', 'amount': '150 г'},
      {'name': 'Сладкий перец', 'amount': '100 г'},
      {'name': 'Красный лук', 'amount': '50 г'},
      {'name': 'Маслины', 'amount': '50 г'},
      {'name': 'Оливковое масло', 'amount': '2 ст. ложки'},
      {'name': 'Фета', 'amount': '100 г'},
      {'name': 'Лимонный сок', 'amount': '1 ст. ложка'},
      {'name': 'Соль и орегано', 'amount': 'по вкусу'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок "Ингредиенты"
          const Text(
            'Ингредиенты',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          // Список ингредиентов с разделителями
          Column(
            children: List.generate(
              ingredients.length,
                  (index) {
                final ingredient = ingredients[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ingredient['name']!,
                            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            ingredient['amount']!,
                            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                    // Добавляем Divider, кроме последнего элемента
                    if (index < ingredients.length - 1)
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                        height: 0,
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 23),
          // Кнопка "Добавить в корзину"
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 12),
              ),
              onPressed: () {
                // Действие при нажатии на кнопку
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: const Text(
                'Добавить в корзину',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPreparationSteps() {
    final steps = [
      {
        'title': 'Подготовка овощей',
        'description': '• Нарежьте помидоры, огурцы и сладкий перец крупными кубиками.\n'
            '• Нарежьте красный лук тонкими полукольцами.\n'
            '• Нарежьте фету кубиками.',
      },
      {
        'title': 'Сборка салата',
        'description': '• Выложите все нарезанные овощи на тарелку, добавьте маслины и фету.\n'
            '• Полейте салат оливковым маслом и соком лимона, посолите и посыпьте орегано.',
      },
      {
        'title': 'Подача',
        'description': '• Перемешайте салат перед подачей.',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок "Приготовление"
          const Text(
            'Приготовление',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          // Список шагов
          Column(
            children: List.generate(steps.length, (index) {
              final step = steps[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Иконка и текст "Шаг X"
                    Column(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.orange, size: 20),
                        const SizedBox(height: 4),
                        Text(
                          'Шаг ${index + 1}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    // Остальная информация о шаге
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step['title']!,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            step['description']!,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

}
