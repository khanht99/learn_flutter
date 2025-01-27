import 'package:flutter/material.dart';
import 'package:section_3/data/question_collect.dart';
import 'package:collection/collection.dart';
import 'package:section_3/model/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onTap, {super.key});

  final void Function() onTap;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < listQuestion.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listQuestion[currentQuestionIndex];

    return Container(
      color: Color.fromRGBO(134, 195, 242, 1),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.answers.map((element) {
              return ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(3, 84, 145, 1),
                  side: BorderSide(
                    color: Color.fromRGBO(3, 84, 145, 1),
                  ),
                ),
                child: SizedBox(
                  width: 500,
                  child: Text(
                    element,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
