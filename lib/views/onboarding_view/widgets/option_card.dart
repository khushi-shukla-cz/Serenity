import 'dart:math' as math;

import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {

  const OptionCard({super.key, required this.title, required this.iconData, required this.bgColor, required this.isSelected, required this.onTap});
  final String title;
  final IconData iconData;
  final Color bgColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
  final verticalPadding = math.max(10, math.min(22, screenHeight * 0.02)).toDouble();
  final iconSize = math.max(36, math.min(56, screenHeight * 0.06)).toDouble();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: math.max(14, iconSize * 0.28).toDouble(),
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(width: iconSize, height: iconSize, child: Icon(iconData, size: (iconSize * 0.7).toDouble(), color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
