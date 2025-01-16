import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "images/quiz-logo.png",
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Learn Flutter the fun way!"),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: () {}, child: Text("Start Quiz")),
          ],
        ),
      ),
    );
  }
}
