import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  final VoidCallback startQuiz;

  const LaunchScreen({super.key, required this.startQuiz()});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(134, 195, 242, 1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "./images/quiz-logo.png",
              width: 250,
              color: Color.fromARGB(150, 255, 255, 255),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Learn Flutter the fun way!"),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: startQuiz,
              label: Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.arrow_right_alt, color: Colors.white),
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromRGBO(3, 84, 145, 1),
                side: BorderSide(
                  color: Color.fromRGBO(3, 84, 145, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
