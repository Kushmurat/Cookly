import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  static const List<String> _categoryTitles = [
    "От Magnum",
    "Овощи, фрукты, орехи",
    "Молоко, сыр, яйца",
    "Хлеб и выпечка",
    "Мясо и птица",
    "Рыба и морепродукты",
    "Бакалея",
    "Сладости и снеки",
    "Готовая еда",
    "Заморозка",
    "Напитки",
    "Специи",
  ];

  static const List<String> _categoryImages = [
    "assets/images/m_shop.png",
    "assets/images/shop_vegetables.png",
    "assets/images/shop_milk.png",
    "assets/images/shop_bakery.png",
    "assets/images/shop_meat.png",
    "assets/images/shop_fish.png",
    "assets/images/shop_krupa.png",
    "assets/images/shop_sweets.png",
    "assets/images/shop_food.png",
    "assets/images/shop_freeze.png",
    "assets/images/shop_drinks.png",
    "assets/images/shop_spices.png",
  ];

  static const List<EdgeInsets> _categoryTextMargins = [
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 20, left: 10, right: 50),
    EdgeInsets.only(top: 20, left: 10, right: 50),
    EdgeInsets.only(top: 20, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 20, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 20, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
    EdgeInsets.only(top: 30, left: 10, right: 50),
  ];

  static const String _logoPath = 'assets/images/magnum.png';

  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            const Text(
              "Укажите адрес доставки",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Цвет кнопки "назад"

      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _logoPath,
                    height: 29,
                    width: 162,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Найти продукты",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 175 / 80,
                    ),
                    itemCount: _categoryTitles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Positioned(
                                top: _categoryTextMargins[index].top,
                                left: _categoryTextMargins[index].left,
                                right: _categoryTextMargins[index].right,
                                child: Text(
                                  _categoryTitles[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Image.asset(
                                  _categoryImages[index],
                                  height: 70,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 28,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                onPressed: () {
                  // Логика для перехода в корзину
                },
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.shopping_cart, size: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
