import 'dart:math' as math;

import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {

  const GoalCard({super.key, required this.title, required this.iconData, required this.bgColor, required this.isSelected, required this.onTap});
  final String title;
  final IconData iconData;
  final Color bgColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
  final cardHeight = math.min(200, math.max(140, screenHeight * 0.22)).toDouble();
  final iconSize = math.min(66, cardHeight * 0.45).toDouble();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF4ECDC4) : Colors.transparent,
            width: 4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: iconSize,
              width: iconSize,
              child: Icon(iconData, size: iconSize * 0.7, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: math.max(14, cardHeight * 0.12).toDouble(),
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
