import 'package:flutter/material.dart';

class DreamScenesIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Butterfly body
    paint.color = const Color(0xFF3FC9C9);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width * 0.08,
        height: size.height * 0.25,
      ),
      paint,
    );

    // Butterfly wings
    paint.color = const Color(0xFFFFB0C0);
    
    // Left wing top
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.35, size.height * 0.4),
        width: size.width * 0.2,
        height: size.height * 0.15,
      ),
      paint,
    );

    // Left wing bottom
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.35, size.height * 0.58),
        width: size.width * 0.18,
        height: size.height * 0.12,
      ),
      paint,
    );

    // Right wing top
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.65, size.height * 0.4),
        width: size.width * 0.2,
        height: size.height * 0.15,
      ),
      paint,
    );

    // Right wing bottom
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.65, size.height * 0.58),
        width: size.width * 0.18,
        height: size.height * 0.12,
      ),
      paint,
    );

    // Antennae
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    canvas.drawLine(
      Offset(size.width * 0.48, size.height * 0.38),
      Offset(size.width * 0.45, size.height * 0.32),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.52, size.height * 0.38),
      Offset(size.width * 0.55, size.height * 0.32),
      paint,
    );

    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.45, size.height * 0.32), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.32), 2, paint);

    // Moon
    paint.color = const Color(0xFFFFF8DC);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.25), size.width * 0.06, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
