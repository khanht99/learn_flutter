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

  var currentQuestion = 0;

  Map<int, int> answerHistory = {};

  void selectAnswer(int selectedIndex) {
    if (currentQuestion < listQuestion.length - 1) {
      setState(() {
        answerHistory[currentQuestion] = selectedIndex;
        currentQuestion++;
      });
    } else {
      setState(() {
        activeScreen = "complete-screen";
      });
    }
  }

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
            : (activeScreen == "question-screen"
                ? QuestionScreen(
                    selectAnswer: (int index) {
                      selectAnswer(index);
                    },
                    currentQuestion: currentQuestion,
                  )
                : CompleteScreen(answerHistory: answerHistory)),
      ),
    );
  }
}
