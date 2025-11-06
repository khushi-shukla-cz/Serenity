import 'package:flutter/material.dart';

class ReflectionIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Lake
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width * 0.5,
        height: size.height * 0.15,
      ),
      paint,
    );

    // Reflection
    paint.color = const Color(0xFF5A6C6C);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.55),
        width: size.width * 0.45,
        height: size.height * 0.08,
      ),
      paint,
    );

    // Tree
    paint.color = const Color(0xFF8BC9C9);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.45), size.width * 0.05, paint);

    // Moon
    paint.color = const Color(0xFFFFF8DC);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), size.width * 0.06, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
