import 'dart:async';
import 'package:cookly/presentation/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'auth_holder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthHolder authHolder;

  @override
  void initState() {
    super.initState();
    authHolder = context.read();
    Timer(const Duration(seconds: 2), _replaceRout);
  }

  void _replaceRout() async {
    if (authHolder.isAuthorized) {
      Navigator.pushReplacementNamed(context, '/main');
      return;
    }
    if (authHolder.isUnauthorized) {
      Navigator.pushReplacementNamed(context, '/sign_in');
      return;
    }
    await authHolder.initialize();
    _replaceRout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cookly',
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
