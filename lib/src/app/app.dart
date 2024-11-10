import 'package:cookly/presentation/auth/authorization.dart';
import 'package:cookly/presentation/auth/registration.dart';
import 'package:cookly/src/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/auth/presentation/screens/sign_in/sign_in_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const SignInScreen(),
    );
  }
}
