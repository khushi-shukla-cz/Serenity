import 'package:flutter/material.dart';

import '../../auth_view/screens/login_screen.dart';
import 'onboarding_flow.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key, this.enableFloating = true});
  /// If false, the subtle floating animation on the avatar is disabled.
  final bool enableFloating;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _avatarController;
  late AnimationController _textController;
  late AnimationController _buttonController;
  late AnimationController? _floatingController;

  late Animation<double> _avatarScaleAnimation;
  late Animation<double> _avatarFadeAnimation;
  late Animation<Offset> _avatarSlideAnimation;

  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _buttonFadeAnimation;

  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    // Avatar animations
    _avatarController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _avatarScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _avatarController,
        curve: Curves.elasticOut,
      ),
    );

    _avatarFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _avatarController,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _avatarSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _avatarController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Text animations
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeIn,
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOut,
      ),
    );

    // Button animations
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeOut,
      ),
    );

    _buttonFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeIn,
      ),
    );

    // Floating animation (continuous) — only when enabled
    if (widget.enableFloating) {
      _floatingController = AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this,
      )..repeat(reverse: true);

      _floatingAnimation = Tween<double>(begin: -10, end: 10).animate(
        CurvedAnimation(
          parent: _floatingController!,
          curve: Curves.easeInOut,
        ),
      );
    } else {
      _floatingController = null;
      _floatingAnimation = const AlwaysStoppedAnimation<double>(0);
    }

    // Start animations sequentially
    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _avatarController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    _textController.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _avatarController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    _floatingController?.dispose();
    super.dispose();
  }

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

              // Animated Avatar
              AnimatedBuilder(
                animation: _floatingController ?? _avatarController,
                builder: (context, child) {
                  // If floating is disabled, just return the child unchanged
                  if (!widget.enableFloating) return child!;

                  return Transform.translate(
                    offset: Offset(0, _floatingAnimation.value),
                    child: child,
                  );
                },
                child: SlideTransition(
                  position: _avatarSlideAnimation,
                  child: FadeTransition(
                    opacity: _avatarFadeAnimation,
                    child: ScaleTransition(
                      scale: _avatarScaleAnimation,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFE8F4F8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3ABAB4).withOpacity(0.1),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/icons/screen2.png',
                              width: 240,
                              height: 240,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 80),

              // Animated Text
              SlideTransition(
                position: _textSlideAnimation,
                child: FadeTransition(
                  opacity: _textFadeAnimation,
                  child: const AnimatedTextWidget(),
                ),
              ),

              const Spacer(flex: 2),

              // Animated Button
              FadeTransition(
                opacity: _buttonFadeAnimation,
                child: ScaleTransition(
                  scale: _buttonScaleAnimation,
                  child: const AnimatedContinueButton(),
                ),
              ),

              const SizedBox(height: 24),

              // Animated Login Link
              FadeTransition(
                opacity: _buttonFadeAnimation,
                child: Row(
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
                      onTap: _navigateWithAnimation,
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
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );

  void _navigateWithAnimation() {
    // Navigate directly to login screen, bypassing onboarding
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }
}

// Animated Text Widget with character-by-character reveal
class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;
  final String fullText =
      'Balance: A meditation\nand sleep program that\nadapts to you.';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _characterCount = StepTween(
      begin: 0,
      end: fullText.length,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        final displayText = fullText.substring(0, _characterCount.value);
        final youIndex = fullText.indexOf('you');

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 28,
              height: 1.4,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
            children: _buildTextSpans(displayText, youIndex),
          ),
        );
      },
    );

  List<TextSpan> _buildTextSpans(String displayText, int youIndex) {
    if (displayText.length <= youIndex) {
      return [TextSpan(text: displayText)];
    }

    final youEndIndex = youIndex + 3; // "you" is 3 characters
    if (displayText.length <= youEndIndex) {
      return [
        TextSpan(text: displayText.substring(0, youIndex)),
        TextSpan(
          text: displayText.substring(youIndex),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ];
    }

    return [
      TextSpan(text: displayText.substring(0, youIndex)),
      TextSpan(
        text: displayText.substring(youIndex, youEndIndex),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      TextSpan(text: displayText.substring(youEndIndex)),
    ];
  }
}

// Animated Continue Button with hover/press effects
class AnimatedContinueButton extends StatefulWidget {
  const AnimatedContinueButton({super.key});

  @override
  State<AnimatedContinueButton> createState() => _AnimatedContinueButtonState();
}

class _AnimatedContinueButtonState extends State<AnimatedContinueButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
      scale: _scaleAnimation,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: GestureDetector(
          onTapDown: (_) {
            setState(() => _isPressed = true);
            _pressController.forward();
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
            _pressController.reverse();
          },
          onTapCancel: () {
            setState(() => _isPressed = false);
            _pressController.reverse();
          },
          child: ElevatedButton(
            onPressed: _animateButtonPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3ABAB4),
              foregroundColor: Colors.white,
              elevation: _isPressed ? 2 : 4,
              shadowColor: const Color(0xFF3ABAB4).withOpacity(0.4),
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
      ),
    );

  void _animateButtonPress() {
    _pressController.forward().then((_) {
      _pressController.reverse();
    });

    // Navigate to onboarding flow after the press animation
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const OnboardingFlow()),
      );
    });
  }
}

// Avatar Painter (same as before)
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
