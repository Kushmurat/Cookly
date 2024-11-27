import 'package:flutter/material.dart';

class BreakfastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Завтрак',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text('Добро пожаловать в раздел Завтраки!'),
      ),
    );
  }
}