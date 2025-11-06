import 'package:flutter/material.dart';

class RainIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Umbrella
    paint.color = const Color(0xFFFFB0C0);
    final umbrellaPath = Path();
    umbrellaPath.moveTo(size.width * 0.3, size.height * 0.5);
    umbrellaPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.35,
      size.width * 0.7, size.height * 0.5,
    );
    umbrellaPath.lineTo(size.width * 0.5, size.height * 0.5);
    umbrellaPath.close();
    canvas.drawPath(umbrellaPath, paint);

    // Handle
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = const Color(0xFF9E9E9E);
    final handlePath = Path();
    handlePath.moveTo(size.width * 0.5, size.height * 0.5);
    handlePath.lineTo(size.width * 0.5, size.height * 0.7);
    handlePath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.75,
      size.width * 0.55, size.height * 0.75,
    );
    canvas.drawPath(handlePath, paint);

    // Rain drops
    paint.color = const Color(0xFF3FC9C9);
    paint.style = PaintingStyle.fill;
    final rainPositions = [
      Offset(size.width * 0.25, size.height * 0.25),
      Offset(size.width * 0.35, size.height * 0.3),
      Offset(size.width * 0.2, size.height * 0.35),
      Offset(size.width * 0.75, size.height * 0.28),
      Offset(size.width * 0.65, size.height * 0.33),
      Offset(size.width * 0.8, size.height * 0.38),
    ];

    for (final pos in rainPositions) {
      canvas.drawLine(pos, Offset(pos.dx, pos.dy + 10), Paint()..strokeWidth = 2..color = const Color(0xFF3FC9C9));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
