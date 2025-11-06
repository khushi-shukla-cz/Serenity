import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class EnergyFlow extends StatefulWidget {
  const EnergyFlow({Key? key}) : super(key: key);

  @override
  State<EnergyFlow> createState() => _EnergyFlowState();
}

class _EnergyFlowState extends State<EnergyFlow> {
  double energy = 50;
  List<ParticleData> particles = [];
  String balance = 'neutral';
  int score = 0;
  int timeLeft = 30;
  Timer? particleTimer;
  Timer? moveTimer;
  Timer? countdownTimer;
  Timer? balanceTimer;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) {
          _endGame();
        }
      });
    });

    particleTimer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      setState(() {
        particles.add(ParticleData(
          id: DateTime.now().millisecondsSinceEpoch,
          x: Random().nextDouble(),
          y: -0.05,
          type: Random().nextDouble() > 0.5 ? 'positive' : 'negative',
        ));
      });
    });

    moveTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        particles = particles
            .map((p) => ParticleData(
                  id: p.id,
                  x: p.x,
                  y: p.y + 0.02,
                  type: p.type,
                ))
            .where((p) => p.y < 1.05)
            .toList();
      });
    });
  }

  void _endGame() {
    particleTimer?.cancel();
    moveTimer?.cancel();
    countdownTimer?.cancel();
    balanceTimer?.cancel();
    Navigator.pop(context, score);
  }

  void _catchParticle(ParticleData particle) {
    setState(() {
      particles.removeWhere((p) => p.id == particle.id);
      if (particle.type == 'positive') {
        energy = (energy + 10).clamp(0, 100);
        score += 10;
        balance = 'positive';
      } else {
        energy = (energy - 10).clamp(0, 100);
        balance = 'negative';
      }
    });

    balanceTimer?.cancel();
    balanceTimer = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          balance = 'neutral';
        });
      }
    });
  }

  @override
  void dispose() {
    particleTimer?.cancel();
    moveTimer?.cancel();
    countdownTimer?.cancel();
    balanceTimer?.cancel();
    super.dispose();
  }

  Color _getBackgroundColor() {
    if (balance == 'positive') {
      return const Color(0xFFD1FAE5);
    } else if (balance == 'negative') {
      return const Color(0xFFFEE2E2);
    } else {
      return const Color(0xFFDBEAFE);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _getBackgroundColor(),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Catch positive energy (☀️) and avoid negative energy (⚡)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...particles.map((particle) => Positioned(
              left: MediaQuery.of(context).size.width * particle.x,
              top: MediaQuery.of(context).size.height * particle.y,
              child: GestureDetector(
                onTap: () => _catchParticle(particle),
                child: Icon(
                  particle.type == 'positive' ? Icons.wb_sunny : Icons.flash_on,
                  size: 40,
                  color: particle.type == 'positive'
                      ? Colors.yellow.shade600
                      : Colors.red.shade500,
                ),
              ),
            )),
            Positioned(
              top: 50,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      'Time: ${timeLeft}s',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.nightlight_round, color: Colors.purple.shade500),
                        const Text(
                          'Energy Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Icon(Icons.wb_sunny, color: Colors.yellow.shade600),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: energy / 100,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFA855F7),
                                Color(0xFFEC4899),
                                Color(0xFFFBBF24),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('← Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParticleData {
  final int id;
  final double x;
  final double y;
  final String type;

  ParticleData({
    required this.id,
    required this.x,
    required this.y,
    required this.type,
  });
}