import 'dart:async';
import 'package:cookly/presentation/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () {
        Navigator.pushReplacementNamed(context,'/');
      },
    );
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
          ],
        ),
      ),
    );
  }
}
