import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading:false,
        title: const Text('Личный кабинет',
          style: TextStyle(
            color: Color(0xFF2E5BB1),
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 32.0),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text(
              'Имя Фамилия',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Специальность',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          // Другие элементы интерфейса...
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Уведомления',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Сообщения',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}