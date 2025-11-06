import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo (use provided asset)
            Image.asset(
              'assets/images/icons/balance.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
}

class BLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final darkTealPaint = Paint()
      ..color = const Color(0xFF004D54)
      ..style = PaintingStyle.fill;

    final lightTealPaint = Paint()
      ..color = const Color(0xFF3ABAB4)
      ..style = PaintingStyle.fill;

    // Draw dark teal top part of B
    final topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.6, 0)
      ..cubicTo(
        size.width * 0.8, 0,
        size.width, size.height * 0.2,
        size.width, size.height * 0.4,
      )
      ..cubicTo(
        size.width, size.height * 0.5,
        size.width * 0.7, size.height * 0.55,
        size.width * 0.5, size.height * 0.5,
      )
      ..lineTo(0, size.height * 0.5)
      ..close();

    canvas.drawPath(topPath, darkTealPaint);

    // Draw light teal bottom part of B
    final bottomPath = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.6, size.height * 0.5)
      ..cubicTo(
        size.width * 0.8, size.height * 0.5,
        size.width, size.height * 0.7,
        size.width, size.height * 0.9,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(bottomPath, lightTealPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
