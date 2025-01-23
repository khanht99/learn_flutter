import 'package:flutter/material.dart';
import 'package:section_3/model/question.dart';

class QuestionResult extends StatelessWidget {
  final Question questionData;
  final int answeredIndex;
  const QuestionResult(
      {super.key, required this.questionData, required this.answeredIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
              color:
                  questionData.answers[0] == questionData.answers[answeredIndex]
                      ? Color.fromARGB(255, 11, 121, 55)
                      : Color.fromARGB(255, 180, 39, 39),
              shape: BoxShape.circle),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionData.title,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Text(
                questionData.answers[answeredIndex],
                style: TextStyle(
                    color: Color.fromARGB(255, 180, 39, 39), fontSize: 11),
                textAlign: TextAlign.left,
              ),
              Text(
                questionData.answers[0],
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 121, 55), fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
