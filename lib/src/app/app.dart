import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'auth_holder.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthHolder authHolder;

  @override
  void initState() {
    super.initState();
    authHolder = AuthHolder(
      localStorage: context.read(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return const SignInScreen();
  }
}
