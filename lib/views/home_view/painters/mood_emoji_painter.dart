import 'package:flutter/material.dart';

class MoodEmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // First emoji (calm)
    paint.color = const Color(0xFFB0D9D9);
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.5), size.width * 0.15, paint);

    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.45), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.45), 2, paint);

    // Second emoji (happy)
    paint.color = const Color(0xFFFFF8DC);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.4), size.width * 0.15, paint);

    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.35), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.35), 2, paint);

    final smilePath = Path();
    smilePath.moveTo(size.width * 0.58, size.height * 0.42);
    smilePath.quadraticBezierTo(
      size.width * 0.65, size.height * 0.47,
      size.width * 0.72, size.height * 0.42,
    );
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    canvas.drawPath(smilePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
