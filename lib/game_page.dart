import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

enum Choice {
  rock,
  paper,
  scissors,
}

class _GamePageState extends State<GamePage> {
  Choice? _userChoice;
  Choice? _computerChoice;
  String _result = '';

  // make choice
  void _makeChoice(Choice choice) {
    setState(() {
      _userChoice = choice;
      _computerChoice = Choice.values[Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rock Paper Scissors'),
        ),
        body: const Center(
          child: Text('data'),
        ));
  }
}
