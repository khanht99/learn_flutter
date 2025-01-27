import 'package:flutter/material.dart';
import 'package:section_3/complete_screen.dart';
import 'package:section_3/launch_screen.dart';
import 'package:section_3/question_screen.dart';
import 'package:section_3/data/question_collect.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";

  

  Map<int, int> answerHistory = {};

  void startQuiz() {
    setState(() {
      activeScreen = "question-screen";
  });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LaunchScreen(startQuiz: startQuiz);
    var currentQuestionIndex = 0;

    if(activeScreen == "question-screen") {
      screenWidget = QuestionScreen(() {
        print("on tap");
        
      });
    } else if(activeScreen == "complete-screen") {

    }

    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
