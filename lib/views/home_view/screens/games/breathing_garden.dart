import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class BreathingGarden extends StatefulWidget {
  const BreathingGarden({Key? key}) : super(key: key);

  @override
  State<BreathingGarden> createState() => _BreathingGardenState();
}

class _BreathingGardenState extends State<BreathingGarden> {
  String breathPhase = 'inhale';
  List<FlowerData> flowers = [];
  int cyclesCompleted = 0;
  bool isActive = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _startBreathingCycle();
  }

  void _startBreathingCycle() {
    if (!isActive) return;

    int duration;
    String nextPhase;

    if (breathPhase == 'inhale') {
      duration = 4000;
      nextPhase = 'hold';
    } else if (breathPhase == 'hold') {
      duration = 4000;
      nextPhase = 'exhale';
    } else {
      duration = 6000;
      nextPhase = 'inhale';
    }

    timer = Timer(Duration(milliseconds: duration), () {
      if (breathPhase == 'exhale') {
        setState(() {
          cyclesCompleted++;
          flowers.add(FlowerData(
            x: Random().nextDouble() * 0.8 + 0.1,
            y: Random().nextDouble() * 0.6 + 0.2,
            type: Random().nextInt(4),
          ));
        });

        if (cyclesCompleted >= 5) {
          isActive = false;
          Navigator.pop(context, flowers.length * 10);
          return;
        }
      }

      setState(() {
        breathPhase = nextPhase;
      });
      _startBreathingCycle();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFEDE9FE), Color(0xFFFCE7F3)],
              ),
            ),
            child: Stack(
              children: [
                // Flowers
                ...flowers.map((flower) => Positioned(
                  left: MediaQuery.of(context).size.width * flower.x,
                  top: MediaQuery.of(context).size.height * flower.y,
                  child: Icon(
                    _getFlowerIcon(flower.type),
                    size: 32,
                    color: _getFlowerColor(flower.type).withOpacity(0.7),
                  ),
                )),
                // Breathing circle
                Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: breathPhase == 'inhale' || breathPhase == 'hold' ? 4000 : 6000),
                    curve: Curves.easeInOut,
                    width: breathPhase == 'exhale' ? 160 : 240,
                    height: breathPhase == 'exhale' ? 160 : 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: _getBreathColors(),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getBreathText(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$cyclesCompleted/5 cycles',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
    );
  }

  IconData _getFlowerIcon(int type) {
    switch (type) {
      case 0: return Icons.local_florist;
      case 1: return Icons.auto_awesome;
      case 2: return Icons.favorite;
      case 3: return Icons.air;
      default: return Icons.local_florist;
    }
  }

  Color _getFlowerColor(int type) {
    switch (type) {
      case 0: return Colors.pink;
      case 1: return Colors.yellow;
      case 2: return Colors.red;
      case 3: return Colors.blue;
      default: return Colors.pink;
    }
  }

  List<Color> _getBreathColors() {
    if (breathPhase == 'inhale') {
      return [Color(0xFF60A5FA), Color(0xFFA855F7)];
    } else if (breathPhase == 'hold') {
      return [Color(0xFFA855F7), Color(0xFFEC4899)];
    } else {
      return [Color(0xFFF472B6), Color(0xFFFB7185)];
    }
  }

  String _getBreathText() {
    if (breathPhase == 'inhale') return 'Breathe In';
    if (breathPhase == 'hold') return 'Hold';
    return 'Breathe Out';
  }
}

class FlowerData {
  final double x;
  final double y;
  final int type;

  FlowerData({required this.x, required this.y, required this.type});
}