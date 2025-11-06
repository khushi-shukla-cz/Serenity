import 'package:flutter/material.dart';

class FoundationsIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2;

    // Circles
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), size.width * 0.15, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), size.width * 0.2, paint);

    // Person
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.38), size.width * 0.04, paint);

    paint.color = const Color(0xFF3FC9C9);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.47),
        width: size.width * 0.12,
        height: size.height * 0.08,
      ),
      paint,
    );

    // Geometric shapes
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.35),
      Offset(size.width * 0.3, size.height * 0.3),
      paint,
    );

    paint.color = const Color(0xFFE0E0E0);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.5), size.width * 0.05, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
