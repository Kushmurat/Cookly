import 'package:flutter/material.dart';
import 'package:cookly/presentation/screens/authorization.dart';
import 'package:cookly/presentation/screens/registration.dart';
import 'package:cookly/presentation/screens/welcome_screen.dart';
import 'package:cookly/presentation/screens/splash_screen.dart';


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
      home: RegScreen(), // Начальная страница
    );
  }
}



