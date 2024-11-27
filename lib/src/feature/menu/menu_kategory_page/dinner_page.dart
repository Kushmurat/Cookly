import 'package:flutter/material.dart';

class DinnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ужин'),
      ),
      body: Center(
        child: Text('Добро пожаловать в раздел Ужины!'),
      ),
    );
  }
}