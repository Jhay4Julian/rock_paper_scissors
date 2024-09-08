import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/components/choice_button.dart';

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
  String _userImage = '';
  String _computerImage = '';
  String _result = '';
  int _userScore = 0;
  int _computerScore = 0;

  // make choice
  void _makeChoice(Choice choice) {
    setState(() {
      _userChoice = choice;
      _computerChoice = Choice.values[Random().nextInt(3)];
      _userImage = _getUserImage();
      _computerImage = _getComputerImage();
      _result = _getWinner();
      _resultColors = resultColor();
      _setScores();
    });
  }

  // List of choice images
  List<String> imageList = [
    'assets/images/rock.png',
    'assets/images/paper.png',
    'assets/images/scissor.png',
  ];

  // get user choice image
  String _getUserImage() {
    if (_userChoice == Choice.rock) {
      return imageList[0];
    } else if (_userChoice == Choice.paper) {
      return imageList[1];
    } else {
      return imageList[2];
    }
  }

  // get computer choice image
  String _getComputerImage() {
    if (_computerChoice == Choice.rock) {
      return imageList[0];
    } else if (_computerChoice == Choice.paper) {
      return imageList[1];
    } else {
      return imageList[2];
    }
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

  // keep scores
  void _setScores() {
    setState(() {
      if (_result == 'Tie') {
        return;
      } else if (_result == 'Computer Win') {
        _computerScore++;
      } else {
        _userScore++;
      }
    });
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
            // Scores
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // User score
                  Row(
                    children: [
                      const Text(
                        'You - ',
                        style: TextStyle(fontSize: 15, letterSpacing: 1),
                      ),
                      // const SizedBox(width: 20),
                      Text(
                        '$_userScore',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  // Computer score
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_computerScore',
                        style: const TextStyle(fontSize: 18),
                      ),
                      // const SizedBox(width: 20),
                      const Text(
                        ' - Computer',
                        style: TextStyle(fontSize: 15, letterSpacing: 1),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

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
            const SizedBox(height: 40),

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
            const SizedBox(height: 40),

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

                // const SizedBox(height: 100),
                // User choice buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceButton(
                      imagePath: 'assets/images/scissor.png',
                      color: Colors.red,
                      onTap: () => _makeChoice(Choice.scissors),
                    ),
                    const SizedBox(width: 10),
                    ChoiceButton(
                      imagePath: 'assets/images/paper.png',
                      color: Colors.yellow,
                      onTap: () => _makeChoice(Choice.paper),
                    ),
                    const SizedBox(width: 10),
                    ChoiceButton(
                      imagePath: 'assets/images/rock.png',
                      color: Colors.blue,
                      onTap: () => _makeChoice(Choice.rock),
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
