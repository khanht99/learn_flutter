import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text("Hello World"),
        ),
      ),
    );
  }
}
