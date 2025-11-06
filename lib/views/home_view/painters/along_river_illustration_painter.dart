import 'package:flutter/material.dart';

class AlongRiverIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Draw water/river (light blue)
    paint.color = const Color(0xFFB3E5FC);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.5),
      paint,
    );

    // Draw boat body (brown)
    paint.color = const Color(0xFF8D6E63);
    final boatPath = Path();
    boatPath.moveTo(size.width * 0.2, size.height * 0.6);
    boatPath.lineTo(size.width * 0.8, size.height * 0.6);
    boatPath.lineTo(size.width * 0.75, size.height * 0.75);
    boatPath.lineTo(size.width * 0.25, size.height * 0.75);
    boatPath.close();
    canvas.drawPath(boatPath, paint);

    // Draw cat body (orange)
    paint.color = const Color(0xFFFF9800);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.5),
        width: size.width * 0.2,
        height: size.height * 0.25,
      ),
      paint,
    );

    // Draw cat head (orange)
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.4),
      size.width * 0.1,
      paint,
    );

    // Draw cat ears (orange triangles)
    final leftEar = Path();
    leftEar.moveTo(size.width * 0.42, size.height * 0.35);
    leftEar.lineTo(size.width * 0.38, size.height * 0.28);
    leftEar.lineTo(size.width * 0.46, size.height * 0.32);
    leftEar.close();
    canvas.drawPath(leftEar, paint);

    final rightEar = Path();
    rightEar.moveTo(size.width * 0.58, size.height * 0.35);
    rightEar.lineTo(size.width * 0.62, size.height * 0.28);
    rightEar.lineTo(size.width * 0.54, size.height * 0.32);
    rightEar.close();
    canvas.drawPath(rightEar, paint);

    // Draw paddle (brown)
    paint.color = const Color(0xFF6D4C41);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    
    // Paddle handle
    canvas.drawLine(
      Offset(size.width * 0.7, size.height * 0.45),
      Offset(size.width * 0.85, size.height * 0.3),
      paint,
    );
    
    // Paddle blade
    paint.style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.88, size.height * 0.27),
        width: size.width * 0.08,
        height: size.height * 0.15,
      ),
      paint,
    );

    // Draw moon (pale yellow)
    paint.color = const Color(0xFFFFF9C4);
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.15),
      size.width * 0.08,
      paint,
    );

    // Draw water ripples (darker blue lines)
    paint.color = const Color(0xFF81D4FA);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    
    for (var i = 0; i < 3; i++) {
      final y = size.height * (0.55 + i * 0.08);
      final path = Path();
      path.moveTo(0, y);
      for (var x = 0.0; x < size.width; x += 20) {
        path.lineTo(x, y + (x % 40 == 0 ? 3 : -3));
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
