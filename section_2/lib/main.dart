import 'package:flutter/material.dart';
import 'package:section_2/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(
        child: GradientContainer(
            null, Alignment.bottomRight, [Colors.brown, Colors.yellowAccent]),
      ),
    );
  }
}
