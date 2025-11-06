import 'package:flutter/material.dart';

class SelfEsteemIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Mirror frame
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.4),
        width: size.width * 0.4,
        height: size.height * 0.5,
      ),
      paint,
    );

    // Mirror interior
    paint.color = const Color(0xFFE8F5F5);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.4),
        width: size.width * 0.32,
        height: size.height * 0.42,
      ),
      paint,
    );

    // Heart in mirror
    paint.color = const Color(0xFFFFB0B0);
    final heartPath = Path();
    heartPath.moveTo(size.width * 0.5, size.height * 0.5);
    heartPath.cubicTo(
      size.width * 0.4, size.height * 0.38,
      size.width * 0.38, size.height * 0.28,
      size.width * 0.5, size.height * 0.32,
    );
    heartPath.cubicTo(
      size.width * 0.62, size.height * 0.28,
      size.width * 0.6, size.height * 0.38,
      size.width * 0.5, size.height * 0.5,
    );
    canvas.drawPath(heartPath, paint);

    // Handle
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.45, size.height * 0.65, size.width * 0.1, size.height * 0.15),
      paint,
    );

    // Lines around mirror
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.35),
      Offset(size.width * 0.15, size.height * 0.3),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.75, size.height * 0.35),
      Offset(size.width * 0.85, size.height * 0.3),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
