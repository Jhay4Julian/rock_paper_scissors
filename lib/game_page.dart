import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/game_button.dart';

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
      _result = _getWinner();
      _resultColors = resultColor();
    });
  }

  // determine winner
  String _getWinner() {
    if (_userChoice == _computerChoice) {
      return 'Tie';
    } else if ((_userChoice == Choice.rock &&
            _computerChoice == Choice.scissors) ||
        (_userChoice == Choice.scissors && _computerChoice == Choice.paper) ||
        (_userChoice == Choice.paper && _computerChoice == Choice.rock)) {
      return 'You Win';
    } else {
      return 'Computer Win';
    }
  }

  Color _resultColors = Colors.transparent;

  MaterialColor resultColor() {
    if (_result == 'Tie') {
      return Colors.grey;
    } else if (_result == 'Computer Win') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Computer choice
            Column(
              children: [
                const Text(
                  'Computer:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  _computerChoice != null
                      ? _computerChoice.toString().toUpperCase().split('.').last
                      : 'Waiting...',
                  style: const TextStyle(fontSize: 22, letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // result
            Container(
              decoration: BoxDecoration(
                  color: _resultColors, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  _result,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 25, letterSpacing: 1),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // User choice
            Column(
              children: [
                const Text(
                  'You:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  _userChoice != null
                      ? _userChoice.toString().toUpperCase().split('.').last
                      : 'Choose your move',
                  style: const TextStyle(fontSize: 22, letterSpacing: 1),
                ),

                const SizedBox(height: 100),
                // User choice buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameButton(
                      title: 'Rock',
                      onTap: () => _makeChoice(Choice.rock),
                    ),
                    GameButton(
                      title: 'Paper',
                      onTap: () => _makeChoice(Choice.paper),
                    ),
                    GameButton(
                      title: 'Scissors',
                      onTap: () => _makeChoice(Choice.scissors),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
