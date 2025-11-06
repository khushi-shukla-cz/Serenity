/// NextButton: Reusable button for onboarding navigation
library;
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.onPressed, this.label = 'Next', super.key});
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) => ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
}
