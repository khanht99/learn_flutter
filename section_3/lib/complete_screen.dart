import 'package:flutter/material.dart';
import 'question_result.dart';
import 'package:section_3/data/question_collect.dart';
import 'package:collection/collection.dart';

class CompleteScreen extends StatelessWidget {
  final Map<int, int> answerHistory;

  const CompleteScreen({super.key, required this.answerHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(134, 195, 242, 1),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "You answered 2 out of 6 questions correctly!",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              ...listQuestion.mapIndexed(
                (index, toElement) {
                  return QuestionResult(
                      questionData: toElement,
                      answeredIndex: answerHistory[index] ?? 0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
