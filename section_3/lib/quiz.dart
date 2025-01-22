import 'package:flutter/material.dart';
import 'package:section_3/launch_screen.dart';
import 'package:section_3/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  @override
  void initState() {
    super.initState();
    activeScreen = "start-screen";
  }

  void startQuiz() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen == "start-screen"
            ? LaunchScreen(
                startQuiz: startQuiz,
              )
            : QuestionScreen(),
      ),
    );
  }
}
