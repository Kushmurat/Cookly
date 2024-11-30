import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Профиль",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Цвет кнопки "назад"

      ),
      backgroundColor: const Color(0xFFF5F5F5), // фон страницы
      body: SingleChildScrollView( // Добавляем прокрутку
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Личный профиль в белом квадрате с отступами по бокам
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Имя Фамилия',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Личный профиль',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const App(), // Здесь ваш целевой экран
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Заголовок Аккаунт
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Аккаунт',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Аккаунт в белом квадрате с отступами по бокам
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
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
                    buildListTile('Избранное', Icons.star_border),
                    buildDivider(),
                    buildListTile('Уведомления', Icons.notifications_none),
                    buildDivider(),
                    buildListTile('Язык', Icons.language),
                    buildDivider(),
                    buildListTile('Поделиться приложением', Icons.share),
                    buildDivider(),
                    buildListTile('Написать в поддержку', Icons.help_outline),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Заголовок Конфиденциальность
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Конфиденциальность',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Конфиденциальность в белом квадрате с отступами по бокам
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
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
                    buildListTile('Заказы', Icons.list_alt),
                    buildDivider(),
                    buildListTile('Адреса', Icons.location_on_outlined),
                    buildDivider(),
                    buildListTile('Платеж', Icons.payment),
                    buildDivider(),
                    buildListTile('Безопасность', Icons.lock_outline),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Виджет для каждой кнопки
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Обработчик нажатия
      },
    );
  }

  // Виджет для полоски с высотой 0.3
  Widget buildDivider() {
    return const Divider(
      color: Colors.grey,
      height: 0.3,
      thickness: 0.3, // Толщина полоски
    );
  }
}
