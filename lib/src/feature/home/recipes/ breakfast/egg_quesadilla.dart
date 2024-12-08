import 'package:flutter/material.dart';

class KesadillaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение
            Stack(
              children: [
                Image.asset(
                  'assets/images/recipe.jpg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: Icon(Icons.star_border, color: Colors.white, size: 30),
                ),
              ],
            ),

            // Заголовок и метаинформация
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Кесадилья с яйцом',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildMetaInfo(icon: Icons.access_time, text: '10 мин'),
                      SizedBox(width: 16),
                      _buildMetaInfo(icon: Icons.local_fire_department, text: 'Ккал 300'),
                      SizedBox(width: 16),
                      _buildMetaInfo(icon: Icons.restaurant, text: 'Легко'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Описание',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Кесадилья с яйцом — это простой и сытный перекус. Начинка из яичницы, сыра и помидоров заворачивается в тортилью и обжаривается до хрустящей корочки.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Ингредиенты
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ингредиенты',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  _buildIngredientRow('Тортилья', '200 г'),
                  _buildIngredientRow('Яйцо', '1 шт'),
                  _buildIngredientRow('Сыр пармезан (натертый)', '40 г'),
                  _buildIngredientRow('Помидор', '1 шт'),
                  _buildIngredientRow('Оливковое масло', '2 ст. ложки'),
                ],
              ),
            ),

            // Кнопка
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Добавить в корзину'),
              ),
            ),

            // Приготовление
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Приготовление',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  _buildStep('Подготовка начинки',
                      'Нарежьте помидор мелкими кубиками. Тёртый сыр приготовьте заранее.'),
                  _buildStep('Обжарка яйца',
                      'На разогретой сковороде с небольшим количеством масла обжарьте яйцо, слегка помешивая.'),
                  _buildStep('Сборка кесадильи',
                      'На одну половину тортильи выложите обжаренное яйцо, помидоры и сыр.'),
                  _buildStep('Обжаривание кесадильи',
                      'Обжарьте кесадилью на сковороде до золотистой корочки с обеих сторон.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaInfo({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.orange),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildIngredientRow(String name, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyle(fontSize: 16)),
        Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStep(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orange,
            child: Text(
              'Ш',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
