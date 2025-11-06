import 'package:flutter/material.dart';

class LovingKindnessIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Heart background
    paint.color = const Color(0xFFFFE0E0);
    final heartPath = Path();
    heartPath.moveTo(size.width * 0.5, size.height * 0.65);
    heartPath.cubicTo(
      size.width * 0.3, size.height * 0.45,
      size.width * 0.25, size.height * 0.25,
      size.width * 0.5, size.height * 0.3,
    );
    heartPath.cubicTo(
      size.width * 0.75, size.height * 0.25,
      size.width * 0.7, size.height * 0.45,
      size.width * 0.5, size.height * 0.65,
    );
    canvas.drawPath(heartPath, paint);

    // Handshake
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.45, size.height * 0.45),
        width: size.width * 0.15,
        height: size.height * 0.2,
      ),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.55, size.height * 0.45),
        width: size.width * 0.15,
        height: size.height * 0.2,
      ),
      paint,
    );

    // Fingers
    paint.color = const Color(0xFF3FC9C9);
    for (var i = 0; i < 4; i++) {
      canvas.drawCircle(
        Offset(size.width * (0.52 + i * 0.02), size.height * 0.5),
        size.width * 0.02,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
