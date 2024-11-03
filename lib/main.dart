import 'package:cookly/presentation/auth/authorization.dart';
import 'package:cookly/presentation/auth/registration.dart';
import 'package:cookly/src/app/app.dart';
import 'package:flutter/material.dart';
import 'package:cookly/presentation/menu/main_menu.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(), // Начальная страница
    );
  }
}



