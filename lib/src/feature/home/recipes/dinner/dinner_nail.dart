import 'package:flutter/material.dart';

class NailPage extends StatelessWidget {
  const NailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Кесадилья с яйцом"),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          "Детали рецепта Кесадилья с яйцом",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
