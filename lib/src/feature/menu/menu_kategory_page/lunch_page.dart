import 'package:flutter/material.dart';

class LunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Обед'),
      ),
      body: Center(
        child: Text('Добро пожаловать в раздел Обеды!'),
      ),
    );
  }
}