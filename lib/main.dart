import 'package:cookly/presentation/auth/registration.dart';
import 'package:cookly/presentation/auth/welcome_screen.dart';
import 'package:cookly/src/app/providers.dart';
import 'package:cookly/src/feature/home/navigation/home_navigation_config.dart';
import 'package:cookly/src/app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app/splash_screen.dart';
import 'src/feature/auth/presentation/screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: '/splash',
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/sign_in': (context) => const SignInScreen(),
          '/main': (context) => WelcomeScreen(),
          '/reg': (context) => RegScreen(),
          '/splash': (context) => const SplashScreen(),
          '/navBar': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
