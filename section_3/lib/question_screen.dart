import 'package:flutter/material.dart';
import 'package:section_3/data/question_collect.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = 0;

  void toNextQuestion() {
    if (currentQuestion < listQuestion.length - 1) {
      setState(() {
        currentQuestion++;
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(134, 195, 242, 1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(listQuestion[currentQuestion].title),
            SizedBox(
              height: 30,
            ),
            ...listQuestion[currentQuestion].answers.map((element) {
              return ElevatedButton(
                onPressed: toNextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(3, 84, 145, 1),
                  side: BorderSide(
                    color: Color.fromRGBO(3, 84, 145, 1),
                  ),
                ),
                child: Text(
                  element,
                  style: TextStyle(color: Colors.white),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
