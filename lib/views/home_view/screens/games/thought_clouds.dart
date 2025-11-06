import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class ThoughtClouds extends StatefulWidget {
  const ThoughtClouds({Key? key}) : super(key: key);

  @override
  State<ThoughtClouds> createState() => _ThoughtCloudsState();
}

class _ThoughtCloudsState extends State<ThoughtClouds> {
  List<CloudData> clouds = [];
  int released = 0;
  int timer = 30;
  Timer? cloudTimer;
  Timer? moveTimer;
  Timer? countdownTimer;

  final List<String> thoughts = ['Worry', 'Stress', 'Anxiety', 'Fear', 'Doubt'];

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    cloudTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        clouds.add(CloudData(
          id: DateTime.now().millisecondsSinceEpoch,
          x: Random().nextDouble() * 0.8,
          y: -0.1,
          speed: Random().nextDouble() * 0.02 + 0.01,
          thought: thoughts[Random().nextInt(thoughts.length)],
        ));
      });
    });

    moveTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        clouds = clouds
            .map((c) => CloudData(
                  id: c.id,
                  x: c.x,
                  y: c.y + c.speed,
                  speed: c.speed,
                  thought: c.thought,
                ))
            .where((c) => c.y < 1.0)
            .toList();
      });
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        this.timer--;
        if (this.timer <= 0) {
          _endGame();
        }
      });
    });
  }

  void _endGame() {
    cloudTimer?.cancel();
    moveTimer?.cancel();
    countdownTimer?.cancel();
    Navigator.pop(context, released * 15);
  }

  void _releaseCloud(int id) {
    setState(() {
      clouds.removeWhere((c) => c.id == id);
      released++;
    });
  }

  @override
  void dispose() {
    cloudTimer?.cancel();
    moveTimer?.cancel();
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDBEAFE), Color(0xFFBFDBFE)],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Tap the clouds to release your thoughts and let them float away',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...clouds.map((cloud) => Positioned(
              left: MediaQuery.of(context).size.width * cloud.x,
              top: MediaQuery.of(context).size.height * cloud.y,
              child: GestureDetector(
                onTap: () => _releaseCloud(cloud.id),
                child: Stack(
                  children: [
                    Icon(
                      Icons.cloud,
                      size: 64,
                      color: Colors.white,
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          cloud.thought,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                      Text(
                        '${timer}s',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      Text(
                        'Released: $released',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
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

class CloudData {
  final int id;
  final double x;
  final double y;
  final double speed;
  final String thought;

  CloudData({
    required this.id,
    required this.x,
    required this.y,
    required this.speed,
    required this.thought,
  });
}