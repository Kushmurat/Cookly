import 'package:flutter/material.dart';

class SaladPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Салаты'),
      ),
      body: Center(
        child: Text('Добро пожаловать в раздел Салаты!'),
      ),
    );
  }
}