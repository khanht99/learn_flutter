import 'package:flutter/material.dart';
import 'package:section_3/data/question_collect.dart';
import 'package:collection/collection.dart';

class QuestionScreen extends StatefulWidget {
  final Function(int) selectAnswer;
  final int currentQuestion;

  const QuestionScreen({super.key, required this.selectAnswer, required this.currentQuestion});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(134, 195, 242, 1),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              listQuestion[widget.currentQuestion].title,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ...listQuestion[widget.currentQuestion].answers.mapIndexed((index, element) {
              return ElevatedButton(
                onPressed: () {
                  widget.selectAnswer(index);
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
