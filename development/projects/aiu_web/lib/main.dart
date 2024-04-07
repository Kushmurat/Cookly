import 'package:aiu_web/private.dart';
import 'package:aiu_web/registration.dart';
import 'package:aiu_web/web_view_conteiner.dart';
import 'package:flutter/material.dart';
import 'authorization.dart';

void main() {
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const LoginPage(),
      routes: {
        '/FirstPage': (context) => const Registration(),
        '/Private' : (context) => ProfileScreen(),
        '/WebViewConteiner' : (context) => WebViewContainer(),
      },

    );
  }
}