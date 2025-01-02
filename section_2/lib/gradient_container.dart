import 'package:flutter/material.dart';
import 'package:section_2/text_styled.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(Alignment? begin, end, this.colors, {super.key}) : beginTest = begin ?? Alignment.topLeft, endTest = end;

  final Alignment beginTest;
  final Alignment endTest;
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: beginTest,
          end: endTest,
          colors: colors,
        ),
      ),
      child: const Center(
        child: Wrap(
          children: [
            TextStyled(displayText: "Hello text 1"),
            TextStyled(displayText: "Hello text 2"),
            TextStyled(displayText: "Hello text 3"),
          ],
        ),
      ),
    );
  }
}
