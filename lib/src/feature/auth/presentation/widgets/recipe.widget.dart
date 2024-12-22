import 'package:cookly/src/feature/recipe/domain/entities/ingredient_amount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildText(String text) {
  return Center(
    child: Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
    ),
  );
}

Widget buildInfoIcon(IconData icon, String text) {
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

Widget buildIngredientsList(List<IngredientAmount> list) {
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
            list.length,
            (index) {
              final ingredient = list[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ingredient.ingredient.name,
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.orange),
                        ),
                        Text(
                          ingredient.amount,
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ),
                  // Добавляем Divider, кроме последнего элемента
                  if (index < list.length - 1)
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

Widget buildPreparationSteps(String steps) {
  // Разделяем шаги по символу новой строки
  List<String> stepList = steps.split('\n');

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
        // Проверка на наличие шагов
        if (stepList.isEmpty)
          const Text(
            'Нет шагов приготовления',
            style: TextStyle(color: Colors.black54),
          )
        else
          // Выводим шаги
          Column(
            children: List.generate(stepList.length, (index) {
              final step = stepList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Иконка и текст "Шаг X"
                    const SizedBox(width: 8),
                    // Текст шага
                    Expanded(
                      child: Text(
                        step,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
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
