import 'package:flutter/material.dart';

import '../../auth_view/screens/login_screen.dart';
import 'onboarding_flow.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              // Avatar/Profile Image (replaced with screen2.png)
              Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8F4F8),
                ),
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/icons/screen2.png',
                      width: 220,
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              // Title and Description
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    height: 1.4,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Balance: A meditation\nand sleep program that\nadapts to ',
                    ),
                    TextSpan(
                      text: 'you',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const OnboardingFlow()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3ABAB4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3ABAB4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
}

class AvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // Body/Shirt (Teal color)
    paint.color = const Color(0xFF3ABAB4);
    final bodyPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.65,
        size.width * 0.7,
        size.height * 0.7,
      )
      ..lineTo(size.width * 0.75, size.height * 0.85)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.9,
        size.width * 0.25,
        size.height * 0.85,
      )
      ..close();
    canvas.drawPath(bodyPath, paint);

    // Face (Peach/Skin color)
    paint.color = const Color(0xFFFFDBC4);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      size.width * 0.18,
      paint,
    );

    // Neck
    final neckRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.6),
        width: size.width * 0.12,
        height: size.height * 0.1,
      ),
      const Radius.circular(10),
    );
    canvas.drawRRect(neckRect, paint);

    // Hair
    paint.color = const Color(0xFFFFB8A0);
    final hairPath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.35)
      ..quadraticBezierTo(
        size.width * 0.32,
        size.height * 0.28,
        size.width * 0.38,
        size.height * 0.28,
      )
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.25,
        size.width * 0.5,
        size.height * 0.27,
      )
      ..quadraticBezierTo(
        size.width * 0.55,
        size.height * 0.25,
        size.width * 0.62,
        size.height * 0.28,
      )
      ..quadraticBezierTo(
        size.width * 0.68,
        size.height * 0.28,
        size.width * 0.65,
        size.height * 0.35,
      )
      ..lineTo(size.width * 0.63, size.height * 0.42)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.32,
        size.width * 0.37,
        size.height * 0.42,
      )
      ..close();
    canvas.drawPath(hairPath, paint);

    // Outline strokes
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    paint.strokeWidth = 2.5;

    // Face outline
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      size.width * 0.18,
      paint,
    );

    // Hair outline
    canvas.drawPath(hairPath, paint);

    // Neck outline
    canvas.drawLine(
      Offset(size.width * 0.44, size.height * 0.58),
      Offset(size.width * 0.44, size.height * 0.65),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.56, size.height * 0.58),
      Offset(size.width * 0.56, size.height * 0.65),
      paint,
    );

    // Body/Shirt outline
    canvas.drawPath(bodyPath, paint);

    // Collar line
    paint.strokeWidth = 2;
    final collarPath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.68)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.72,
        size.width * 0.65,
        size.height * 0.68,
      );
    canvas.drawPath(collarPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
