import 'package:flutter/material.dart';

class WindowIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Window frame
    paint.color = Colors.white;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.1, size.height * 0.2, size.width * 0.8, size.height * 0.6),
      paint,
    );

    // Black right panel
    paint.color = Colors.black;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.75, size.height * 0.2, size.width * 0.15, size.height * 0.6),
      paint,
    );

    // Plant pot
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.65, size.width * 0.15, size.height * 0.1),
      paint,
    );

    // Plant leaves
    paint.color = Colors.black;
    final path = Path();
    path.moveTo(size.width * 0.275, size.height * 0.65);
    path.lineTo(size.width * 0.25, size.height * 0.45);
    path.lineTo(size.width * 0.22, size.height * 0.55);
    path.lineTo(size.width * 0.2, size.height * 0.4);
    path.lineTo(size.width * 0.23, size.height * 0.52);
    path.lineTo(size.width * 0.275, size.height * 0.35);
    path.lineTo(size.width * 0.26, size.height * 0.5);
    path.lineTo(size.width * 0.32, size.height * 0.4);
    path.lineTo(size.width * 0.29, size.height * 0.55);
    path.close();
    canvas.drawPath(path, paint);

    // Moon
    paint.color = const Color(0xFFFFF8DC);
    canvas.drawCircle(
      Offset(size.width * 0.55, size.height * 0.35),
      size.width * 0.08,
      paint,
    );

    // Stars
    paint.color = Colors.black;
    final starPositions = [
      Offset(size.width * 0.35, size.height * 0.3),
      Offset(size.width * 0.45, size.height * 0.25),
      Offset(size.width * 0.38, size.height * 0.45),
      Offset(size.width * 0.5, size.height * 0.5),
      Offset(size.width * 0.6, size.height * 0.55),
    ];

    for (final pos in starPositions) {
      canvas.drawCircle(pos, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
