import 'package:flutter/material.dart';

class DessertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Десерты'),
      ),
      body: Center(
        child: Text('Добро пожаловать в раздел Десерты!'),
      ),
    );
  }
}