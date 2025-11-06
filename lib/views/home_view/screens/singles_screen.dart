import 'dart:math';
import 'package:flutter/material.dart';

class SinglesScreen extends StatelessWidget {
  const SinglesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.search, size: 28, color: Colors.black),
                  ],
                ),
              ),
              
              // START YOUR DAY Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'START YOUR DAY',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: BirdsongCard()),
                    SizedBox(width: 16),
                    Expanded(child: MorningBrewCard()),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              // Unlock all meditations banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Unlock all meditations.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3BB3BD),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'UPGRADE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: MorningGratitudeCard()),
                    SizedBox(width: 16),
                    Expanded(child: SunriseMelodyCard()),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: WakeUpCard()),
                    SizedBox(width: 16),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // RELIEVE STRESS Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'RELIEVE STRESS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: AnxietyCard()),
                        SizedBox(width: 16),
                        Expanded(child: BodyScanCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: BreatheCard()),
                        SizedBox(width: 16),
                        Expanded(child: CleaningCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: FrustrationCard()),
                        SizedBox(width: 16),
                        Expanded(child: LettingGoCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: RelaxCard()),
                        SizedBox(width: 16),
                        Expanded(child: ShowerCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: SOSCard()),
                        SizedBox(width: 16),
                        Expanded(child: SundayScariesCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: UnguidedCard()),
                        SizedBox(width: 16),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // WHILE YOU WORK Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'WHILE YOU WORK',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: BurnoutReliefCard()),
                        SizedBox(width: 16),
                        Expanded(child: DeepFocusCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: EaseIntoWorkCard()),
                        SizedBox(width: 16),
                        Expanded(child: FlowStateCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: InTheZoneCard()),
                        SizedBox(width: 16),
                        Expanded(child: LoFiFocusCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: PomodoroCard()),
                        SizedBox(width: 16),
                        Expanded(child: TaskTimerCard()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // FIND FOCUS Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'FIND FOCUS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: ADHDCard()),
                        SizedBox(width: 16),
                        Expanded(child: BrainFogCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: ConcentrateCard()),
                        SizedBox(width: 16),
                        Expanded(child: CreativityCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: EveningResetCard()),
                        SizedBox(width: 16),
                        Expanded(child: JournalCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: MiddayResetCard()),
                        SizedBox(width: 16),
                        Expanded(child: MotivationCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: ProcrastinationCard()),
                        SizedBox(width: 16),
                        Expanded(child: QuickRefocusCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: SoundScanCard()),
                        SizedBox(width: 16),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // GET SUPPORT Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'GET SUPPORT',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: BreakingHabitsCard()),
                        SizedBox(width: 16),
                        Expanded(child: ForgivenessCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: GriefCard()),
                        SizedBox(width: 16),
                        Expanded(child: PainCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: SickDayCard()),
                        SizedBox(width: 16),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // LIFT YOUR MOOD Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'LIFT YOUR MOOD',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CommuteCard()),
                        SizedBox(width: 16),
                        Expanded(child: EnergizeCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: GratitudeCard()),
                        SizedBox(width: 16),
                        Expanded(child: JoyCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: LovingKindnessCard()),
                        SizedBox(width: 16),
                        Expanded(child: PositivityCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: SelfEsteemCard()),
                        SizedBox(width: 16),
                        Expanded(child: WalkingCard()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // SHARE WITH OTHERS Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'SHARE WITH OTHERS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9E9E9E),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: CouplesCard()),
                        SizedBox(width: 16),
                        Expanded(child: EatingCard()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: KidsCard()),
                        SizedBox(width: 16),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
}

class MeditationCard extends StatelessWidget {

  const MeditationCard({
    super.key,
    required this.title,
    required this.illustration,
  });
  final String title;
  final Widget illustration;

  @override
  Widget build(BuildContext context) => Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: SizedBox(
                  // Use a nominal intrinsic size so FittedBox can preserve aspect ratio
                  // while scaling the illustration to the available card space.
                  width: 140,
                  height: 100,
                  child: illustration,
                ),
              ),
            ),
          ),
        ],
      ),
    );
}

// Birdsong Card
class BirdsongCard extends StatelessWidget {
  const BirdsongCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Birdsong',
      illustration: Image.asset(
        'assets/images/icons/birdsong.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class BirdsongPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Branch
    paint.color = Colors.black;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, size.height * 0.5, size.width - 40, 8),
        const Radius.circular(4),
      ),
      paint,
    );
    
    // Leaves
    paint.color = const Color(0xFFB8E6D5);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.7, size.height * 0.6), width: 20, height: 30), paint);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.85, size.height * 0.55), width: 16, height: 24), paint);
    
    // Left bird body
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.3, size.height * 0.35), width: 28, height: 32),
      paint,
    );
    
    // Right bird body
    paint.color = const Color(0xFF8DD4D9);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.55, size.height * 0.3), width: 32, height: 36),
      paint,
    );
    
    // Right bird wing
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.6, size.height * 0.32), width: 20, height: 28),
      paint,
    );
    
    // Beaks
    paint.color = const Color(0xFFE8B49A);
    final beakPath1 = Path()
      ..moveTo(size.width * 0.23, size.height * 0.35)
      ..lineTo(size.width * 0.18, size.height * 0.35)
      ..lineTo(size.width * 0.21, size.height * 0.37)
      ..close();
    canvas.drawPath(beakPath1, paint);
    
    final beakPath2 = Path()
      ..moveTo(size.width * 0.64, size.height * 0.28)
      ..lineTo(size.width * 0.69, size.height * 0.28)
      ..lineTo(size.width * 0.66, size.height * 0.3)
      ..close();
    canvas.drawPath(beakPath2, paint);
    
    // Music notes
    paint.color = Colors.black87;
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.1), 3, paint);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.4 + 2.5, size.height * 0.1 - 15, 1.5, 15), paint);
    
    canvas.drawCircle(Offset(size.width * 0.48, size.height * 0.15), 2.5, paint);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.48 + 2, size.height * 0.15 - 12, 1.5, 12), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Morning Brew Card
class MorningBrewCard extends StatelessWidget {
  const MorningBrewCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Morning Brew',
      illustration: Image.asset(
        'assets/images/icons/brew.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class MorningBrewPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Kettle body
    paint.color = const Color(0xFFD4D9E8);
    final kettlePath = Path()
      ..moveTo(size.width * 0.55, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.3, size.width * 0.9, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.8, size.width * 0.72, size.height * 0.85)
      ..lineTo(size.width * 0.38, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.8, size.width * 0.2, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.3, size.width * 0.55, size.height * 0.3)
      ..close();
    canvas.drawPath(kettlePath, paint);
    
    // Kettle lid
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.3), 8, paint);
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.3), 2, paint);
    
    // Handle
    paint.color = const Color(0xFFE8E8E8);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    final handlePath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.45, size.width * 0.05, size.height * 0.65)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.75, size.width * 0.2, size.height * 0.75);
    canvas.drawPath(handlePath, paint);
    
    // Cup
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF3BB3BD);
    final cupPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.5)
      ..lineTo(size.width * 0.2, size.height * 0.85)
      ..lineTo(size.width * 0.42, size.height * 0.85)
      ..lineTo(size.width * 0.37, size.height * 0.5)
      ..close();
    canvas.drawPath(cupPath, paint);
    
    // Cup handle
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = const Color(0xFF3BB3BD);
    final cupHandlePath = Path()
      ..moveTo(size.width * 0.19, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.08, size.height * 0.65, size.width * 0.15, size.height * 0.75);
    canvas.drawPath(cupHandlePath, paint);
    
    // Steam
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFD4D9E8);
    final steam1 = Path()
      ..moveTo(size.width * 0.26, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.24, size.height * 0.35, size.width * 0.28, size.height * 0.25);
    canvas.drawPath(steam1, paint);
    
    final steam2 = Path()
      ..moveTo(size.width * 0.34, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.36, size.height * 0.35, size.width * 0.32, size.height * 0.25);
    canvas.drawPath(steam2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Morning Gratitude Card
class MorningGratitudeCard extends StatelessWidget {
  const MorningGratitudeCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Morning Gratitude',
      illustration: Image.asset(
        'assets/images/icons/gra.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class MorningGratitudePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Window frame
    paint.color = Colors.black;
    canvas.drawRect(Rect.fromLTWH(size.width * 0.15, size.height * 0.15, size.width * 0.7, size.height * 0.7), paint);
    
    // Window panes (background)
    paint.color = const Color(0xFFE8E8F0);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.18, size.height * 0.18, size.width * 0.64, size.height * 0.64), paint);
    
    // Center divider
    paint.color = Colors.black;
    canvas.drawRect(Rect.fromLTWH(size.width * 0.49, size.height * 0.15, size.width * 0.02, size.height * 0.7), paint);
    
    // Sun
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.4), 18, paint);
    
    // Vase
    paint.color = Colors.white;
    final vasePath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.55)
      ..lineTo(size.width * 0.32, size.height * 0.75)
      ..lineTo(size.width * 0.46, size.height * 0.75)
      ..lineTo(size.width * 0.43, size.height * 0.55)
      ..close();
    canvas.drawPath(vasePath, paint);
    
    // Flower
    paint.color = const Color(0xFFFFD4C8);
    canvas.drawCircle(Offset(size.width * 0.36, size.height * 0.48), 6, paint);
    
    // Flower center
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawCircle(Offset(size.width * 0.36, size.height * 0.48), 3, paint);
    
    // Curtains
    paint.color = const Color(0xFFE8E8F0);
    final leftCurtainPath = Path()
      ..moveTo(size.width * 0.15, size.height * 0.15)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.22, size.height * 0.82)
      ..lineTo(size.width * 0.15, size.height * 0.82)
      ..close();
    canvas.drawPath(leftCurtainPath, paint);
    
    final rightCurtainPath = Path()
      ..moveTo(size.width * 0.85, size.height * 0.15)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.3, size.width * 0.78, size.height * 0.82)
      ..lineTo(size.width * 0.85, size.height * 0.82)
      ..close();
    canvas.drawPath(rightCurtainPath, paint);
    
    // Birds
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFBBBBBB);
    
    final bird1 = Path()
      ..moveTo(size.width * 0.58, size.height * 0.28)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.25, size.width * 0.62, size.height * 0.28);
    canvas.drawPath(bird1, paint);
    
    final bird2 = Path()
      ..moveTo(size.width * 0.64, size.height * 0.32)
      ..quadraticBezierTo(size.width * 0.66, size.height * 0.29, size.width * 0.68, size.height * 0.32);
    canvas.drawPath(bird2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Sunrise Melody Card
class SunriseMelodyCard extends StatelessWidget {
  const SunriseMelodyCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Sunrise Melody',
      illustration: Image.asset(
        'assets/images/icons/mel.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class SunriseMelodyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,
  Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Frame
    paint.color = Colors.black;
    canvas.drawRect(Rect.fromLTWH(size.width * 0.1, size.height * 0.15, size.width * 0.8, size.height * 0.7), paint);
    
    // Sky
    paint.color = const Color(0xFFB8E6D5);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.12, size.height * 0.17, size.width * 0.76, size.height * 0.66), paint);
    
    // Sun (half circle)
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.7, size.height * 0.83), width: 60, height: 60),
      3.14159,
      3.14159,
      false,
      paint,
    );
    
    // Landscape
    paint.color = const Color(0xFFFFD4C8);
    final landscapePath = Path()
      ..moveTo(size.width * 0.12, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.5, size.width * 0.5, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.6, size.width * 0.88, size.height * 0.5)
      ..lineTo(size.width * 0.88, size.height * 0.83)
      ..lineTo(size.width * 0.12, size.height * 0.83)
      ..close();
    canvas.drawPath(landscapePath, paint);
    
    // Cup with steam
    paint.color = const Color(0xFF3BB3BD);
    final cupPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.62)
      ..lineTo(size.width * 0.22, size.height * 0.8)
      ..lineTo(size.width * 0.38, size.height * 0.8)
      ..lineTo(size.width * 0.35, size.height * 0.62)
      ..close();
    canvas.drawPath(cupPath, paint);
    
    // Steam
    paint.color = const Color(0xFFFFD4C8);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    final steam = Path()
      ..moveTo(size.width * 0.28, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.5, size.width * 0.3, size.height * 0.42);
    canvas.drawPath(steam, paint);
    
    // Music notes
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black87;
    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.28), 3, paint);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.68 + 2, size.height * 0.28 - 12, 1.5, 12), paint);
    
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.32), 2.5, paint);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.75 + 2, size.height * 0.32 - 10, 1.5, 10), paint);
    
    // Birds
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFBBBBBB);
    
    final bird1 = Path()
      ..moveTo(size.width * 0.4, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.22, size.width * 0.44, size.height * 0.25);
    canvas.drawPath(bird1, paint);
    
    final bird2 = Path()
      ..moveTo(size.width * 0.46, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.48, size.height * 0.27, size.width * 0.5, size.height * 0.3);
    canvas.drawPath(bird2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Wake Up Card
class WakeUpCard extends StatelessWidget {
  const WakeUpCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Wake Up',
      illustration: Image.asset(
        'assets/images/icons/upp.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class WakeUpPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Rooster body
    paint.color = const Color(0xFFFFD4C8);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.6), width: 50, height: 60),
      paint,
    );
    
    // Rooster head
    paint.color = const Color(0xFFFFE8DC);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.35), 18, paint);
    
    // Crest
    paint.color = const Color(0xFF3BB3BD);
    final crestPath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.22)
      ..quadraticBezierTo(size.width * 0.47, size.height * 0.15, size.width * 0.5, size.height * 0.18)
      ..quadraticBezierTo(size.width * 0.53, size.height * 0.13, size.width * 0.55, size.height * 0.22)
      ..close();
    canvas.drawPath(crestPath, paint);
    
    // Tail feathers
    paint.color = const Color(0xFF3BB3BD);
    final tailPath = Path()
      ..moveTo(size.width * 0.6, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.35, size.width * 0.8, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.78, size.height * 0.5, size.width * 0.7, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.65, size.height * 0.58, size.width * 0.6, size.height * 0.55)
      ..close();
    canvas.drawPath(tailPath, paint);
    
    // Beak
    paint.color = const Color(0xFFE8B49A);
    final beakPath = Path()
      ..moveTo(size.width * 0.55, size.height * 0.35)
      ..lineTo(size.width * 0.6, size.height * 0.35)
      ..lineTo(size.width * 0.57, size.height * 0.38)
      ..close();
    canvas.drawPath(beakPath, paint);
    
    // Eye
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.52, size.height * 0.33), 2, paint);
    
    // Ground
    paint.color = const Color(0xFFE8E8E8);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.2, size.height * 0.75, size.width * 0.6, 3),
      paint,
    );
    
    // Sun rising
    paint.color = const Color(0xFFFFE8DC);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.75, size.height * 0.75), width: 40, height: 40),
      3.14159,
      3.14159,
      false,
      paint,
    );
    
    // Sun rays
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFE8E8E8);
    for (var i = 0; i < 4; i++) {
      final angle = (i * 3.14159 / 6) + 3.14159;
      final x1 = size.width * 0.75 + 22 * cos(angle);
      final y1 = size.height * 0.75 + 22 * sin(angle);
      final x2 = size.width * 0.75 + 30 * cos(angle);
      final y2 = size.height * 0.75 + 30 * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Anxiety Card
class AnxietyCard extends StatelessWidget {
  const AnxietyCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Anxiety',
      illustration: Image.asset(
        'assets/images/icons/anxiety.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class AnxietyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Water/sea
    paint.color = const Color(0xFFB8E6D5);
    final waterPath = Path()
      ..moveTo(0, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.55, size.width * 0.5, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.65, size.width, size.height * 0.6)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(waterPath, paint);
    
    // Boat
    paint.color = const Color(0xFF3BB3BD);
    final boatPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.55)
      ..lineTo(size.width * 0.25, size.height * 0.65)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.68, size.width * 0.4, size.height * 0.68)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.68, size.width * 0.55, size.height * 0.65)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..close();
    canvas.drawPath(boatPath, paint);
    
    // Sail
    paint.color = const Color(0xFFE8E8E8);
    final sailPath = Path()
      ..moveTo(size.width * 0.4, size.height * 0.55)
      ..lineTo(size.width * 0.4, size.height * 0.25)
      ..lineTo(size.width * 0.55, size.height * 0.4)
      ..close();
    canvas.drawPath(sailPath, paint);
    
    // Mast
    paint.color = Colors.black;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.395, size.height * 0.25, 2, size.height * 0.3),
      paint,
    );
    
    // Dock
    paint.color = const Color(0xFFFFE8DC);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.7, size.height * 0.63, size.width * 0.15, 4),
      paint,
    );
    
    // Clouds
    paint.color = const Color(0xFFE8E8E8);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.2, size.height * 0.25), width: 30, height: 15), paint);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.7, size.height * 0.2), width: 35, height: 18), paint);
    
    // Wind lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFD0D0D0);
    canvas.drawLine(Offset(size.width * 0.15, size.height * 0.35), Offset(size.width * 0.25, size.height * 0.35), paint);
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.42), Offset(size.width * 0.2, size.height * 0.42), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Body Scan Card
class BodyScanCard extends StatelessWidget {
  const BodyScanCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Body Scan',
      illustration: Image.asset(
        'assets/images/icons/scan.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class BodyScanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Head
    paint.color = const Color(0xFFE8E8F0);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.25), 14, paint);
    
    // Body
    paint.color = const Color(0xFF3BB3BD);
    final bodyPath = Path()
      ..moveTo(size.width * 0.4, size.height * 0.35)
      ..lineTo(size.width * 0.35, size.height * 0.6)
      ..lineTo(size.width * 0.65, size.height * 0.6)
      ..lineTo(size.width * 0.6, size.height * 0.35)
      ..close();
    canvas.drawPath(bodyPath, paint);
    
    // Arms extended
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.15, size.height * 0.4, size.width * 0.2, 8),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.65, size.height * 0.4, size.width * 0.2, 8),
      paint,
    );
    
    // Legs
    paint.color = const Color(0xFFD4D9E8);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.38, size.height * 0.6, 8, size.height * 0.25),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.54, size.height * 0.6, 8, size.height * 0.25),
      paint,
    );
    
    // Scan lines (circles around body)
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFD4D9E8);
    
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.45), width: size.width * 0.6, height: 40),
      paint,
    );
    
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.55), width: size.width * 0.5, height: 30),
      paint,
    );
    
    // Dots around
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFD4D9E8);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), 4, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.3), 4, paint);
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.5), 3, paint);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.5), 3, paint);
    
    paint.color = const Color(0xFFFFD4C8);
    canvas.drawCircle(Offset(size.width * 0.82, size.height * 0.65), 3, paint);
    canvas.drawCircle(Offset(size.width * 0.18, size.height * 0.65), 3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Breathe Card
class BreatheCard extends StatelessWidget {
  const BreatheCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Breathe',
      illustration: Image.asset(
        'assets/images/icons/breathe.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class BreathePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Leaf
    paint.color = const Color(0xFFB8E6D5);
    final leafPath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.32, size.height * 0.5, size.width * 0.35, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.38, size.height * 0.2, size.width * 0.42, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.3, size.width * 0.45, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.7, size.width * 0.35, size.height * 0.7)
      ..close();
    canvas.drawPath(leafPath, paint);
    
    // Leaf vein
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFF8DD4D9);
    canvas.drawLine(
      Offset(size.width * 0.38, size.height * 0.7),
      Offset(size.width * 0.42, size.height * 0.25),
      paint,
    );
    
    // Clouds
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF3BB3BD);
    
    // Cloud 1
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.35), 12, paint);
    canvas.drawCircle(Offset(size.width * 0.72, size.height * 0.35), 10, paint);
    canvas.drawCircle(Offset(size.width * 0.66, size.height * 0.32), 11, paint);
    
    // Cloud 2
    paint.color = const Color(0xFF8DD4D9);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.55), 10, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.55), 9, paint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.52), 10, paint);
    
    // Wind lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFD0D0D0);
    
    final wind1 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.48)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.46, size.width * 0.58, size.height * 0.48);
    canvas.drawPath(wind1, paint);
    
    final wind2 = Path()
      ..moveTo(size.width * 0.48, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.52, size.height * 0.58, size.width * 0.55, size.height * 0.6);
    canvas.drawPath(wind2, paint);
    
    // Ground line
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFE8E8E8);
    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.7),
      Offset(size.width * 0.5, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Cleaning Card
class CleaningCard extends StatelessWidget {
  const CleaningCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Cleaning',
      illustration: Image.asset(
        'assets/images/icons/cleaning.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.black26, size: 28),
          ),
        ),
      ),
    );
}

class CleaningPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Basket
    paint.color = const Color(0xFFE8E8F0);
    final basketPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.45)
      ..lineTo(size.width * 0.25, size.height * 0.75)
      ..lineTo(size.width * 0.75, size.height * 0.75)
      ..lineTo(size.width * 0.7, size.height * 0.45)
      ..close();
    canvas.drawPath(basketPath, paint);
    
    // Basket lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFD0D0D0);
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.45), Offset(size.width * 0.32, size.height * 0.75), paint);
    canvas.drawLine(Offset(size.width * 0.5, size.height * 0.45), Offset(size.width * 0.5, size.height * 0.75), paint);
    canvas.drawLine(Offset(size.width * 0.65, size.height * 0.45), Offset(size.width * 0.68, size.height * 0.75), paint);
    
    // Horizontal lines
    canvas.drawLine(Offset(size.width * 0.28, size.height * 0.55), Offset(size.width * 0.72, size.height * 0.55), paint);
    canvas.drawLine(Offset(size.width * 0.27, size.height * 0.65), Offset(size.width * 0.73, size.height * 0.65), paint);
    
    // Spray bottle
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF3BB3BD);
    
    // Bottle body
    final bottlePath = Path()
      ..moveTo(size.width * 0.6, size.height * 0.35)
      ..lineTo(size.width * 0.58, size.height * 0.52)
      ..lineTo(size.width * 0.72, size.height * 0.52)
      ..lineTo(size.width * 0.7, size.height * 0.35)
      ..close();
    canvas.drawPath(bottlePath, paint);
    
    // Spray nozzle
    paint.color = const Color(0xFF8DD4D9);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.6, size.height * 0.3, size.width * 0.1, 5),
      paint,
    );
    
    // Spray trigger
    final triggerPath = Path()
      ..moveTo(size.width * 0.65, size.height * 0.3)
      ..lineTo(size.width * 0.62, size.height * 0.38)
      ..lineTo(size.width * 0.68, size.height * 0.38)
      ..close();
    canvas.drawPath(triggerPath, paint);
    
    // Sponge/cloth
    paint.color = const Color(0xFFFFE8DC);
    final spongePathOuter = Path()
      ..addOval(Rect.fromCenter(center: Offset(size.width * 0.82, size.height * 0.35), width: 28, height: 35));
    canvas.drawPath(spongePathOuter, paint);
    
    // Sparkles
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;
    paint.color = const Color(0xFFD0D0D0);
    
    // Sparkle 1
    canvas.drawLine(Offset(size.width * 0.48, size.height * 0.28), Offset(size.width * 0.48, size.height * 0.35), paint);
    canvas.drawLine(Offset(size.width * 0.44, size.height * 0.315), Offset(size.width * 0.52, size.height * 0.315), paint);
    
    // Sparkle 2
    canvas.drawLine(Offset(size.width * 0.78, size.height * 0.58), Offset(size.width * 0.78, size.height * 0.64), paint);
    canvas.drawLine(Offset(size.width * 0.75, size.height * 0.61), Offset(size.width * 0.81, size.height * 0.61), paint);
    
    // Small dots
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.54, size.height * 0.4), 1.5, paint);
    canvas.drawCircle(Offset(size.width * 0.42, size.height * 0.38), 1.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// I'll continue with more cards. Due to length, I'll create simplified versions for the remaining cards:

// Frustration Card
class FrustrationCard extends StatelessWidget {
  const FrustrationCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Frustration',
      illustration: Image.asset(
        'assets/images/icons/fr.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class FrustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Volcano base
    paint.color = const Color(0xFFFFE8DC);
    final volcanoPath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.75)
      ..lineTo(size.width * 0.35, size.height * 0.45)
      ..lineTo(size.width * 0.65, size.height * 0.45)
      ..lineTo(size.width * 0.8, size.height * 0.75)
      ..close();
    canvas.drawPath(volcanoPath, paint);
    
    // Lava/explosion
    paint.color = const Color(0xFFFFB8A8);
    final lavaPath = Path()
      ..moveTo(size.width * 0.42, size.height * 0.45)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.35, size.width * 0.5, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.35, size.width * 0.58, size.height * 0.45)
      ..close();
    canvas.drawPath(lavaPath, paint);
    
    // Smoke cloud
    paint.color = const Color(0xFFE8E8E8);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.22), 12, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.18), 14, paint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.22), 12, paint);
    
    // Explosion lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFD0D0D0);
    
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.35), Offset(size.width * 0.25, size.height * 0.25), paint);
    canvas.drawLine(Offset(size.width * 0.65, size.height * 0.35),
    Offset(size.width * 0.75, size.height * 0.25), paint);
    
    // Small explosion dots
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFD0D0D0);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.38, size.height * 0.25), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.62, size.height * 0.25), 2, paint);
    
    // Ground line
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.75), Offset(size.width * 0.9, size.height * 0.75), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Letting Go Card
class LettingGoCard extends StatelessWidget {
  const LettingGoCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Letting Go',
      illustration: Image.asset(
        'assets/images/icons/le.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class LettingGoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Leaf
    paint.color = const Color(0xFF3BB3BD);
    final leafPath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.65)
      ..quadraticBezierTo(size.width * 0.38, size.height * 0.5, size.width * 0.42, size.height * 0.35)
      ..quadraticBezierTo(size.width * 0.48, size.height * 0.3, size.width * 0.52, size.height * 0.35)
      ..quadraticBezierTo(size.width * 0.58, size.height * 0.48, size.width * 0.52, size.height * 0.62)
      ..quadraticBezierTo(size.width * 0.48, size.height * 0.68, size.width * 0.45, size.height * 0.65)
      ..close();
    canvas.drawPath(leafPath, paint);
    
    // Another leaf piece
    paint.color = const Color(0xFFFFD4C8);
    final leaf2Path = Path()
      ..moveTo(size.width * 0.6, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.64, size.height * 0.38, size.width * 0.68, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.66, size.height * 0.48, size.width * 0.62, size.height * 0.5)
      ..close();
    canvas.drawPath(leaf2Path, paint);
    
    // Ground elements
    paint.color = const Color(0xFFFFE8DC);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.3, size.height * 0.75), width: 40, height: 15), paint);
    
    paint.color = const Color(0xFFE8E8DC);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.7, size.height * 0.78), width: 35, height: 12), paint);
    
    // Wind lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFD0D0D0);
    
    final wind1 = Path()
      ..moveTo(size.width * 0.25, size.height * 0.35)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.33, size.width * 0.35, size.height * 0.35);
    canvas.drawPath(wind1, paint);
    
    final wind2 = Path()
      ..moveTo(size.width * 0.7, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.53, size.width * 0.8, size.height * 0.55);
    canvas.drawPath(wind2, paint);
    
    // Small decorative circles
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFFFE8C8);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.4), 4, paint);
    canvas.drawCircle(Offset(size.width * 0.82, size.height * 0.68), 3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Relax Card
class RelaxCard extends StatelessWidget {
  const RelaxCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Relax',
      illustration: Image.asset(
        'assets/images/icons/re.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class RelaxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Hammock
    paint.color = const Color(0xFF3BB3BD);
    final hammockPath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.65, size.width * 0.8, size.height * 0.5)
      ..lineTo(size.width * 0.78, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.68, size.width * 0.22, size.height * 0.55)
      ..close();
    canvas.drawPath(hammockPath, paint);
    
    // Palm tree left
    paint.color = Colors.black;
    final trunk1Path = Path()
      ..moveTo(size.width * 0.18, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.35, size.width * 0.17, size.height * 0.25)
      ..lineTo(size.width * 0.2, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.22, size.height * 0.35, size.width * 0.2, size.height * 0.5)
      ..close();
    canvas.drawPath(trunk1Path, paint);
    
    // Palm leaves left
    paint.color = Colors.black;
    for (var i = 0; i < 5; i++) {
      final angle = (i * 0.6) - 1.2;
      final leafPath = Path()
        ..moveTo(size.width * 0.185, size.height * 0.25)
        ..quadraticBezierTo(
          size.width * 0.185 + 20 * cos(angle) / 2,
          size.height * 0.25 + 20 * sin(angle) / 2,
          size.width * 0.185 + 25 * cos(angle),
          size.height * 0.25 + 25 * sin(angle),
        );
      
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3;
      canvas.drawPath(leafPath, paint);
    }
    
    // Palm tree right
    paint.style = PaintingStyle.fill;
    final trunk2Path = Path()
      ..moveTo(size.width * 0.82, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.35, size.width * 0.83, size.height * 0.25)
      ..lineTo(size.width * 0.8, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.78, size.height * 0.35, size.width * 0.8, size.height * 0.5)
      ..close();
    canvas.drawPath(trunk2Path, paint);
    
    // Palm leaves right
    for (var i = 0; i < 5; i++) {
      final angle = (i * 0.6) - 1.2;
      final leafPath = Path()
        ..moveTo(size.width * 0.815, size.height * 0.25)
        ..quadraticBezierTo(
          size.width * 0.815 + 20 * cos(angle) / 2,
          size.height * 0.25 + 20 * sin(angle) / 2,
          size.width * 0.815 + 25 * cos(angle),
          size.height * 0.25 + 25 * sin(angle),
        );
      
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 3;
      canvas.drawPath(leafPath, paint);
    }
    
    // Sun
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFFFE8DC);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.35), 16, paint);
    
    // Ground
    paint.color = const Color(0xFFE8E8E8);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.15, size.height * 0.7, size.width * 0.7, 3), paint);
    
    // Small grass
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFB8E6D5);
    canvas.drawLine(Offset(size.width * 0.25, size.height * 0.7), Offset(size.width * 0.27, size.height * 0.62), paint);
    canvas.drawLine(Offset(size.width * 0.75, size.height * 0.7), Offset(size.width * 0.73, size.height * 0.65), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Shower Card
class ShowerCard extends StatelessWidget {
  const ShowerCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Shower',
      illustration: Image.asset(
        'assets/images/icons/sh.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class ShowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Bathtub
    paint.color = const Color(0xFFFFE8DC);
    final tubPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width * 0.8, size.height * 0.75)
      ..lineTo(size.width * 0.75, size.height * 0.6)
      ..close();
    canvas.drawPath(tubPath, paint);
    
    // Bathtub rim
    paint.color = const Color(0xFFD4D9E8);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.2, size.height * 0.58, size.width * 0.6, 4), paint);
    
    // Bathtub legs
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.78), 3, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.78), 3, paint);
    
    // Water in tub
    paint.color = const Color(0xFF3BB3BD);
    final waterPath = Path()
      ..moveTo(size.width * 0.28, size.height * 0.65)
      ..lineTo(size.width * 0.24, size.height * 0.73)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.76, size.width * 0.76, size.height * 0.73)
      ..lineTo(size.width * 0.72, size.height * 0.65)
      ..close();
    canvas.drawPath(waterPath, paint);
    
    // Shower head
    paint.color = const Color(0xFFD4D9E8);
    final showerHeadPath = Path()
      ..moveTo(size.width * 0.6, size.height * 0.25)
      ..lineTo(size.width * 0.55, size.height * 0.3)
      ..lineTo(size.width * 0.75, size.height * 0.3)
      ..lineTo(size.width * 0.7, size.height * 0.25)
      ..close();
    canvas.drawPath(showerHeadPath, paint);
    
    // Shower pipe
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = const Color(0xFFD4D9E8);
    final pipePath = Path()
      ..moveTo(size.width * 0.65, size.height * 0.25)
      ..lineTo(size.width * 0.65, size.height * 0.15)
      ..quadraticBezierTo(size.width * 0.68, size.height * 0.12, size.width * 0.72, size.height * 0.12)
      ..lineTo(size.width * 0.8, size.height * 0.12);
    canvas.drawPath(pipePath, paint);
    
    // Water drops
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFB8E6D5);
    for (var i = 0; i < 8; i++) {
      final x = size.width * 0.56 + (i * 3);
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, size.height * 0.38 + (i % 2) * 4), width: 2, height: 6),
        paint,
      );
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, size.height * 0.48 + (i % 2) * 4), width: 2, height: 6),
        paint,
      );
    }
    
    // Soap/shampoo bottles
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.78, size.height * 0.52, 8, 12), paint);
    
    paint.color = const Color(0xFFB8E6D5);
    canvas.drawRect(Rect.fromLTWH(size.width * 0.78, size.height * 0.5, 8, 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// SOS Card
class SOSCard extends StatelessWidget {
  const SOSCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'SOS',
      illustration: Image.asset(
        'assets/images/icons/sos.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class SOSPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Hand
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: 40, height: 50),
      paint,
    );
    
    // Geometric shapes floating around
    paint.color = const Color(0xFFFFD4C8);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    
    // Diamond
    final diamondPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.35)
      ..lineTo(size.width * 0.3, size.height * 0.42)
      ..lineTo(size.width * 0.25, size.height * 0.49)
      ..lineTo(size.width * 0.2, size.height * 0.42)
      ..close();
    canvas.drawPath(diamondPath, paint);
    
    // Triangle
    paint.color = const Color(0xFFFFD4C8);
    final trianglePath = Path()
      ..moveTo(size.width * 0.65, size.height * 0.7)
      ..lineTo(size.width * 0.72, size.height * 0.8)
      ..lineTo(size.width * 0.58, size.height * 0.8)
      ..close();
    canvas.drawPath(trianglePath, paint);
    
    // Rectangle
    paint.color = const Color(0xFFB8E6D5);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.7, size.height * 0.25, 15, 20),
      paint,
    );
    
    // Paper/note
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFE8E8F0);
    final paperPath = Path()
      ..moveTo(size.width * 0.55, size.height * 0.35)
      ..lineTo(size.width * 0.55, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..lineTo(size.width * 0.75, size.height * 0.35)
      ..close();
    canvas.drawPath(paperPath, paint);
    
    // Paper fold
    paint.color = const Color(0xFFD0D0D0);
    final foldPath = Path()
      ..moveTo(size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width * 0.75, size.height * 0.4)
      ..lineTo(size.width * 0.8, size.height * 0.4)
      ..close();
    canvas.drawPath(foldPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Sunday Scaries Card
class SundayScariesCard extends StatelessWidget {
  const SundayScariesCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Sunday Scaries',
      illustration: Image.asset(
        'assets/images/icons/su.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class SundayScariesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Calendar base
    paint.color = Colors.black;
    final calendarBasePath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.35)
      ..lineTo(size.width * 0.2, size.height * 0.75)
      ..lineTo(size.width * 0.8, size.height * 0.75)
      ..lineTo(size.width * 0.75, size.height * 0.35)
      ..close();
    canvas.drawPath(calendarBasePath, paint);
    
    // Calendar top (binding)
    paint.color = const Color(0xFF3BB3BD);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.25, size.height * 0.28, size.width * 0.5, 7),
      paint,
    );
    
    // Calendar rings
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.315), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.315), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.315), 2, paint);
    
    // Calendar page
    paint.color = Colors.white;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.27, size.height * 0.38, size.width * 0.46, size.height * 0.35),
      paint,
    );
    
    // Calendar grid (simplified)
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.color = const Color(0xFFE8E8E8);
    
    for (var i = 0; i < 4; i++) {
      final y = size.height * 0.45 + i * 6;
      canvas.drawLine(
        Offset(size.width * 0.3, y),
        Offset(size.width * 0.7, y),
        paint,
      );
    }
    
    for (var i = 0; i < 5; i++) {
      final x = size.width * 0.3 + i * 10;
      canvas.drawLine(
        Offset(x, size.height * 0.45),
        Offset(x, size.height * 0.68),
        paint,
      );
    }
    
    // Exclamation mark
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFFFD4C8);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.78, size.height * 0.42, 4, 15),
      paint,
    );
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.62), 2.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Unguided Card
class UnguidedCard extends StatelessWidget {
  const UnguidedCard({super.key});

  @override
  Widget build(BuildContext context) => MeditationCard(
      title: 'Unguided',
      illustration: Image.asset(
        'assets/images/icons/un.jpg',
        width: 140,
        height: 100,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 140,
          height: 100,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
}

class UnguidedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    
    // Signpost pole
    paint.color = Colors.black;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.48, size.height * 0.35, 4, size.height * 0.45),
      paint,
    );
    
    // Sign arrows
    paint.color = const Color(0xFF3BB3BD);
    
    // Left arrow
    final leftArrowPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.45)
      ..lineTo(size.width * 0.2, size.height * 0.5)
      ..lineTo(size.width * 0.25, size.height * 0.55)
      ..lineTo(size.width * 0.48, size.height * 0.55)
      ..lineTo(size.width * 0.48, size.height * 0.45)
      ..close();
    canvas.drawPath(leftArrowPath, paint);
    
    paint.color = const Color(0xFF8DD4D9);
    
    // Right arrow
    final rightArrowPath = Path()
      ..moveTo(size.width * 0.52, size.height * 0.55)
      ..lineTo(size.width * 0.75, size.height * 0.55)
      ..lineTo(size.width * 0.8, size.height * 0.5)
      ..lineTo(size.width * 0.75, size.height * 0.45)
      ..lineTo(size.width * 0.52, size.height * 0.45)
      ..close();
    canvas.drawPath(rightArrowPath, paint);
    
    // Mountains in background
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFB8E6D5);
    
    final mountainPath = Path()
      ..moveTo(size.width * 0.15, size.height * 0.4)
      ..lineTo(size.width * 0.22, size.height * 0.25)
      ..lineTo(size.width * 0.3, size.height * 0.35);
    canvas.drawPath(mountainPath, paint);
    
    // Circle (sun/moon)
    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFFD4D9E8);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.35), 12, paint);
    
    // Ground/grass
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = const Color(0xFFB8E6D5);
    
    canvas.drawLine(Offset(size.width * 0.38, size.height * 0.8), Offset(size.width * 0.42, size.height * 0.72), paint);
    canvas.drawLine(Offset(size.width * 0.58, size.height * 0.8), Offset(size.width * 0.62, size.height * 0.75), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// For the remaining cards, I'll create placeholder implementations that follow the same pattern:

class BurnoutReliefCard extends StatelessWidget {
  const BurnoutReliefCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Burnout Relief',
        illustration: Image.asset(
          'assets/images/icons/bu.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class DeepFocusCard extends StatelessWidget {
  const DeepFocusCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Deep Focus',
        illustration: Image.asset(
          'assets/images/icons/de.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class EaseIntoWorkCard extends StatelessWidget {
  const EaseIntoWorkCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Ease into Work',
        illustration: Image.asset(
          'assets/images/icons/ea.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class FlowStateCard extends StatelessWidget {
  const FlowStateCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Flow State',
        illustration: Image.asset(
          'assets/images/icons/fl.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class InTheZoneCard extends StatelessWidget {
  const InTheZoneCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'In the Zone',
        illustration: Image.asset(
          'assets/images/icons/in.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class LoFiFocusCard extends StatelessWidget {
  const LoFiFocusCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Lo-Fi Focus',
        illustration: Image.asset(
          'assets/images/icons/lo.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class PomodoroCard extends StatelessWidget {
  const PomodoroCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Pomodoro',
        illustration: Image.asset(
          'assets/images/icons/po.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class TaskTimerCard extends StatelessWidget {
  const TaskTimerCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Task Timer',
        illustration: Image.asset(
          'assets/images/icons/ta.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class ADHDCard extends StatelessWidget {
  const ADHDCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'ADHD',
        illustration: Image.asset(
          'assets/images/icons/adhd.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class BrainFogCard extends StatelessWidget {
  const BrainFogCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Brain Fog',
        illustration: Image.asset(
          'assets/images/icons/brain.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class ConcentrateCard extends StatelessWidget {
  const ConcentrateCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Concentrate',
        illustration: Image.asset(
          'assets/images/icons/con.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class CreativityCard extends StatelessWidget {
  const CreativityCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Creativity',
        illustration: Image.asset(
          'assets/images/icons/cre.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class EveningResetCard extends StatelessWidget {
  const EveningResetCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Evening Reset',
        illustration: Image.asset(
          'assets/images/icons/ev.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class JournalCard extends StatelessWidget {
  const JournalCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Journal',
        illustration: Image.asset(
          'assets/images/icons/jo.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class MiddayResetCard extends StatelessWidget {
  const MiddayResetCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Midday Reset',
        illustration: Image.asset(
          'assets/images/icons/mi.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class MotivationCard extends StatelessWidget {
  const MotivationCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Motivation',
        illustration: Image.asset(
          'assets/images/icons/mo.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class ProcrastinationCard extends StatelessWidget {
  const ProcrastinationCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Procrastination',
        illustration: Image.asset(
          'assets/images/icons/pro.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class QuickRefocusCard extends StatelessWidget {
  const QuickRefocusCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Quick Refocus',
        illustration: Image.asset(
          'assets/images/icons/qu.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class SoundScanCard extends StatelessWidget {
  const SoundScanCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Sound Scan',
        illustration: Image.asset(
          'assets/images/icons/so.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class BreakingHabitsCard extends StatelessWidget {
  const BreakingHabitsCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Breaking Habits',
        illustration: Image.asset(
          'assets/images/icons/br.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class ForgivenessCard extends StatelessWidget {
  const ForgivenessCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Forgiveness',
        illustration: Image.asset(
          'assets/images/icons/for.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class GriefCard extends StatelessWidget {
  const GriefCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Grief',
        illustration: Image.asset(
          'assets/images/icons/gr.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class PainCard extends StatelessWidget {
  const PainCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Pain',
        illustration: Image.asset(
          'assets/images/icons/pa.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class SickDayCard extends StatelessWidget {
  const SickDayCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Sick Day',
        illustration: Image.asset(
          'assets/images/icons/si.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class CommuteCard extends StatelessWidget {
  const CommuteCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Commute',
        illustration: Image.asset(
          'assets/images/icons/co.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class EnergizeCard extends StatelessWidget {
  const EnergizeCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Energize',
        illustration: Image.asset(
          'assets/images/icons/en.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class GratitudeCard extends StatelessWidget {
  const GratitudeCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Gratitude',
        illustration: Image.asset(
          'assets/images/icons/gra.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class JoyCard extends StatelessWidget {
  const JoyCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Joy',
        illustration: Image.asset(
          'assets/images/icons/joy.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class LovingKindnessCard extends StatelessWidget {
  const LovingKindnessCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Loving Kindness',
        illustration: Image.asset(
          'assets/images/icons/loving_kindness.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class PositivityCard extends StatelessWidget {
  const PositivityCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Positivity',
        illustration: Image.asset(
          'assets/images/icons/pos.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class SelfEsteemCard extends StatelessWidget {
  const SelfEsteemCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Self-Esteem',
        illustration: Image.asset(
          'assets/images/icons/esteem.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class WalkingCard extends StatelessWidget {
  const WalkingCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Walking',
        illustration: Image.asset(
          'assets/images/icons/wa.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class CouplesCard extends StatelessWidget {
  const CouplesCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Couples',
        illustration: Image.asset(
          'assets/images/icons/couple.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class EatingCard extends StatelessWidget {
  const EatingCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Eating',
        illustration: Image.asset(
          'assets/images/icons/eating.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}

class KidsCard extends StatelessWidget {
  const KidsCard({super.key});
  @override
  Widget build(BuildContext context) => MeditationCard(
        title: 'Kids',
        illustration: Image.asset(
          'assets/images/icons/ki.jpg',
          width: 140,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 140,
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
}