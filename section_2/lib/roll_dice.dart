import 'dart:math';
import 'package:flutter/material.dart';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RoleDiceState();
}

class _RoleDiceState extends State<RollDice> {
  final random = Random();

  var currentDiceActive = 2;

  void rollDice() {
    setState(() {
      currentDiceActive = random.nextInt(6) + 1;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('images/dice-$currentDiceActive.png'),
        TextButton(
          onPressed: rollDice,
          child: const Text(
            "Roll Dice",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
