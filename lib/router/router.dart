import 'package:flutter/material.dart';
import 'package:cookly/presentation/screens/authorization.dart';
import 'package:cookly/presentation/screens/registration.dart';
import 'package:cookly/presentation/screens/welcome_screen.dart';
import 'package:cookly/presentation/screens/splash_screen.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/': (context) =>  WelcomeScreen(),
        '/auth': (context) =>  AuthScreen(),
        '/reg':(context) =>  RegScreen(),
        '/splash': (context)=> SplashScreen()
      },
    );
  }
}
