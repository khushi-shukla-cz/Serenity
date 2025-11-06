import 'package:flutter/material.dart';

class BottomCTA extends StatelessWidget {

  const BottomCTA({super.key, required this.onPressed, this.label = 'TAP TO CONTINUE'});
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 6),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF4ECDC4),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
}
