import 'package:flutter/material.dart';

import '../../ai_chat/ai_chat.dart';
import '../../auth/presentation/widgets/app_icon.widget.dart';
import '../../favorite/favorite.dart';
import '../../menu/main_menu.dart';
import '../../profile/profile.dart';
import '../../shop/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Список экранов для вкладок
  static final List<Widget> _pages = <Widget>[
    const MainMenu(),
    const FavoritePage(),
    const AiChatScreen(),
    const ShopScreen(),
    const ProfileScreen(),
  ];

  // Функция для обработки нажатия на вкладку
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon('ic_home'),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_star'),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_ai_cook'),
            label: 'Ассистент',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_basket'),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_profile'),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[800],
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }


}
