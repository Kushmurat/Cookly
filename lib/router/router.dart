import 'package:flutter/material.dart';

import '../presentation/auth/authorization.dart';
import '../presentation/auth/registration.dart';
import '../presentation/auth/splash_screen.dart';
import '../presentation/auth/welcome_screen.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) =>  WelcomeScreen(),
        '/auth': (context) =>  AuthScreen(),
        '/reg':(context) =>  RegScreen(),
        '/splash': (context)=> SplashScreen()
      },
    );
  }
}
