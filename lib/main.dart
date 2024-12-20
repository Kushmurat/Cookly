import 'package:cookly/presentation/auth/registration.dart';
import 'package:cookly/presentation/auth/splash_screen.dart';
import 'package:cookly/presentation/auth/welcome_screen.dart';
import 'package:cookly/src/feature/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:cookly/src/feature/home/navigation/home_navigation_config.dart';
import 'package:cookly/src/feature/menu/main_menu.dart';
import 'package:cookly/src/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/auth': (context) => const App(),
        '/reg': (context) => RegScreen(),
        '/splash': (context) => const SplashScreen(),
        '/navBar': (context) => const HomeScreen(),
      },
    );
  }
}




