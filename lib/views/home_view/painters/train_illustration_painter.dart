import 'package:flutter/material.dart';

class TrainIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Book/Frame
    paint.color = Colors.black;
    final path = Path();
    path.moveTo(size.width * 0.7, size.height * 0.2);
    path.lineTo(size.width * 0.9, size.height * 0.3);
    path.lineTo(size.width * 0.9, size.height * 0.7);
    path.lineTo(size.width * 0.7, size.height * 0.8);
    path.close();
    canvas.drawPath(path, paint);

    // Train body
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.3, size.height * 0.45, size.width * 0.35, size.height * 0.2),
      paint,
    );

    // Train cabin
    paint.color = const Color(0xFFE0E0E0);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.5, size.height * 0.35, size.width * 0.08, size.height * 0.1),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
