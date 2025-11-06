import 'package:flutter/material.dart';
import 'meditation_flow_screens.dart';

class FoundationsOnboardingScreen extends StatefulWidget {
  const FoundationsOnboardingScreen({Key? key, this.selectedDay = 1}) : super(key: key);
  final int selectedDay;

  @override
  State<FoundationsOnboardingScreen> createState() => _FoundationsOnboardingScreenState();
}

class _FoundationsOnboardingScreenState extends State<FoundationsOnboardingScreen> {
  int currentScreen = 0;
  final int totalScreens = 12;

  void nextScreen() {
    if (currentScreen < totalScreens - 1) {
      setState(() {
        currentScreen++;
      });
    } else {
      // Navigate to the preparing screen when onboarding is complete
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoadingScreen(selectedDay: widget.selectedDay)),
      );
    }
  }

  void previousScreen() {
    if (currentScreen > 0) {
      setState(() {
        currentScreen--;
      });
    }
  }

  double get progress => (currentScreen + 1) / totalScreens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.localPosition.dx > width / 2) {
            nextScreen();
          } else {
            previousScreen();
          }
        },
        child: Stack(
          children: [
            _buildScreen(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF4DB8B8),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (currentScreen != 11)
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, size: 28, color: Colors.black),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    switch (currentScreen) {
      case 0:
        return _buildWelcomeScreen();
      case 1:
        return _buildReducedStressScreen();
      case 2:
        return _buildChallengingScreen();
      case 3:
        return _buildTwoTipsScreen();
      case 4:
        return _buildTip1Screen();
      case 5:
        return _buildTip1DetailScreen();
      case 6:
        return _buildTip1CalendarScreen();
      case 7:
        return _buildTip2Screen();
      case 8:
        return _buildTip2DetailScreen();
      case 9:
        return _buildTip2ConfirmScreen();
      case 10:
        return _buildProgressMessageScreen();
      case 11:
        return _buildDayReportScreen();
      default:
        return _buildWelcomeScreen();
    }
  }

  Widget _buildWelcomeScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Welcome to your\nFoundations Plan,\nKHUSHI!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  height: 1.3,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5,
                ),
              ),
              const Spacer(flex: 1),
              const Text(
                'TAP TO CONTINUE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4DB8B8),
                  fontSize: 12,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReducedStressScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[50],
                ),
                child: CustomPaint(
                  painter: StonesPainter(),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Reduced Stress',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'You\'ll learn meditation\nbasics to help with\nyour goal.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengingScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Meditation is rewarding,\nbut it can also feel\nchallenging at first.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.7,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTwoTipsScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'So here are 2 tips\nto get you started.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.7,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip1Screen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TIP 1',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Practice daily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip1DetailScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(200, 150),
                painter: CalendarPainter(),
              ),
              const SizedBox(height: 40),
              const Text(
                'People who train\ndaily benefit more.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip1CalendarScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: const Size(200, 150),
                    painter: CalendarPainter(),
                  ),
                  Positioned(
                    top: -40,
                    right: 60,
                    child: CustomPaint(
                      size: const Size(80, 80),
                      painter: ClockPainter(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'To form a daily habit,\nmeditate at the same\ntime each day.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip2Screen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TIP 2',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'It\'s OK if your\nmind wanders',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip2DetailScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(200, 200),
                painter: ThinkingPersonPainter(),
              ),
              const SizedBox(height: 40),
              const Text(
                'It\'s normal to feel\ndistracted or fidgety\nwhen you meditate.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip2ConfirmScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(200, 200),
                painter: CheckPersonPainter(),
              ),
              const SizedBox(height: 40),
              const Text(
                'There\'s no such thing\nas a "bad" meditation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressMessageScreen() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Because with\neach session, you\'re\nmaking progress.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.7,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayReportScreen() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Day 1 Report',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Foundations',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Time trained',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '5 hr 41 min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                  Text(
                    'Daily streak',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '1 day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  'Skills developed',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Icon(Icons.info_outline, color: Colors.grey[400]),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.air,
                    color: Color(0xFF4DB8B8),
                    size: 32,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Breath Focus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Level 6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: Colors.grey[800],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF4DB8B8),
                          ),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              'TAP TO CONTINUE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

// Custom Painters
class StonesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Top stone (teal)
    paint.color = const Color(0xFF4DB8B8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 36,
        height: 24,
      ),
      paint,
    );

    // Middle stone (white)
    paint.color = Colors.white;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 44,
        height: 32,
      ),
      paint,
    );

    // Bottom stone (teal)
    paint.color = const Color(0xFF4DB8B8);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.7),
        width: 56,
        height: 40,
      ),
      paint,
    );

    // Outlines
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    paint.strokeWidth = 2;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 36,
        height: 24,
      ),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 44,
        height: 32,
      ),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.7),
        width: 56,
        height: 40,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CalendarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw calendar body
    final rect = Rect.fromLTWH(size.width * 0.1, size.height * 0.2, size.width * 0.8, size.height * 0.7);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)), paint);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)), borderPaint);

    // Draw calendar header
    final headerRect = Rect.fromLTWH(size.width * 0.1, size.height * 0.2, size.width * 0.8, size.height * 0.15);
    paint.color = const Color(0xFF4DB8B8);
    canvas.drawRRect(RRect.fromRectAndRadius(headerRect, const Radius.circular(8)), paint);

    // Draw calendar grid
    paint.color = Colors.grey[300]!;
    for (int i = 1; i < 7; i++) {
      double x = size.width * 0.1 + (size.width * 0.8 / 7 * i);
      canvas.drawLine(
        Offset(x, size.height * 0.35),
        Offset(x, size.height * 0.9),
        paint,
      );
    }

    for (int i = 1; i < 6; i++) {
      double y = size.height * 0.35 + (size.height * 0.55 / 6 * i);
      canvas.drawLine(
        Offset(size.width * 0.1, y),
        Offset(size.width * 0.9, y),
        paint,
      );
    }

    // Draw some filled calendar days
    paint.color = const Color(0xFF4DB8B8);
    for (int i = 0; i < 5; i++) {
      double x = size.width * 0.15 + (size.width * 0.8 / 7 * i);
      double y = size.height * 0.4;
      canvas.drawCircle(Offset(x, y), 8, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw clock face
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 - 4, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 - 4, borderPaint);

    // Draw clock hands
    final center = Offset(size.width / 2, size.height / 2);
    
    // Hour hand
    paint.color = Colors.black;
    paint.strokeWidth = 3;
    canvas.drawLine(
      center,
      Offset(center.dx, center.dy - size.height * 0.2),
      paint,
    );

    // Minute hand
    paint.strokeWidth = 2;
    canvas.drawLine(
      center,
      Offset(center.dx + size.width * 0.25, center.dy),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ThinkingPersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4DB8B8)
      ..style = PaintingStyle.fill;

    // Draw simple person silhouette
    // Head
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.25),
      size.width * 0.15,
      paint,
    );

    // Body
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.6),
        width: size.width * 0.3,
        height: size.height * 0.5,
      ),
      paint,
    );

    // Thought bubbles
    paint.color = Colors.grey[300]!;
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.2), 12, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.15), 8, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.1), 6, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CheckPersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4DB8B8)
      ..style = PaintingStyle.fill;

    // Draw simple person silhouette
    // Head
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.25),
      size.width * 0.15,
      paint,
    );

    // Body
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.6),
        width: size.width * 0.3,
        height: size.height * 0.5,
      ),
      paint,
    );

    // Check mark
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    
    final path = Path();
    path.moveTo(size.width * 0.7, size.height * 0.15);
    path.lineTo(size.width * 0.75, size.height * 0.2);
    path.lineTo(size.width * 0.85, size.height * 0.1);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Placeholder widgets for visualization screens
class BreathingVisualization extends StatelessWidget {
  const BreathingVisualization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: const Center(
        child: Text(
          'Breathing Visualization',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class AudioVisualizationScreen extends StatelessWidget {
  const AudioVisualizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: const Center(
        child: Text(
          'Audio Visualization',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class MeditationPlayerScreen extends StatelessWidget {
  const MeditationPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[50],
      child: const Center(
        child: Text(
          'Meditation Player',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CreatingReportScreen extends StatelessWidget {
  const CreatingReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[50],
      child: const Center(
        child: Text(
          'Creating Report...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}