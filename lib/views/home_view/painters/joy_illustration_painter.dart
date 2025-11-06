import 'package:flutter/material.dart';

class JoyIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Kite body
    paint.color = const Color(0xFF3FC9C9);
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width * 0.65, size.height * 0.45);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.35, size.height * 0.45);
    path.close();
    canvas.drawPath(path, paint);

    // Kite tail
    paint.color = const Color(0xFF3FC9C9);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    final tailPath = Path();
    tailPath.moveTo(size.width * 0.5, size.height * 0.6);
    tailPath.quadraticBezierTo(
      size.width * 0.4, size.height * 0.7,
      size.width * 0.35, size.height * 0.8,
    );
    canvas.drawPath(tailPath, paint);

    // Sun
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFFFF8DC);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.25), size.width * 0.08, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
