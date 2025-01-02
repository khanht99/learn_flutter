import 'package:flutter/material.dart';

class TextStyled extends StatelessWidget {
  const TextStyled({required this.displayText, this.textColor, this.textSize, super.key});

  final String displayText;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(context) {
    return Text(
      displayText,
      style: TextStyle(
        fontSize: textSize ?? 48.0,
        fontWeight: FontWeight.bold,
        color: textColor ?? const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
