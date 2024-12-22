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


  // Список начальных экранов для вкладок
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _pages = [
    const MainMenu(),
    const FavoritePage(),
    AiChatScreen(),
    const ShopScreen(),
    const ProfileScreen(),
  ];

  // Обработка нажатия на вкладку
  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // Если вкладка выбрана повторно, возвращаемся на её начальный экран
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Создаём навигацию для каждой вкладки
  Widget _buildTabNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => _pages[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(
          _pages.length,
              (index) => Offstage(
            offstage: _selectedIndex != index,
            child: _buildTabNavigator(index),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon(
              'ic_home',
              color: _selectedIndex == 0 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(
              'ic_star',
              color: _selectedIndex == 1 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(
              'ic_ai_cook',
              color: _selectedIndex == 2 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Ассистент',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(
              'ic_basket',
              color: _selectedIndex == 3 ? Colors.amber[800] : Colors.grey[800],
            ),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(
              'ic_profile',
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
