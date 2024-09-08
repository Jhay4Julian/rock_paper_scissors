import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String imagePath;
  final Color color;
  final VoidCallback onTap;
  const ChoiceButton({
    super.key,
    required this.imagePath,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Center(
        child: MaterialButton(
          padding: const EdgeInsets.all(12),
          shape: const CircleBorder(),
          color: color,
          onPressed: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
