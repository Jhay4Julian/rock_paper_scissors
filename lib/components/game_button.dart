import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GameButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
