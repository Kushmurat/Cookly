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
    AiChatScreen(),
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon('ic_home',
              color: _selectedIndex == 0 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_star',
              color: _selectedIndex == 1 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_ai_cook',
              color: _selectedIndex == 2 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Ассистент',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_basket',
              color: _selectedIndex == 3 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: AppIcon('ic_profile',
              color: _selectedIndex == 4 ? Colors.amber[800] : Colors.grey[800],
            ),
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
