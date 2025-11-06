import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class GratitudeStars extends StatefulWidget {
  const GratitudeStars({Key? key}) : super(key: key);

  @override
  State<GratitudeStars> createState() => _GratitudeStarsState();
}

class _GratitudeStarsState extends State<GratitudeStars> {
  List<StarData> stars = [];
  int collected = 0;
  List<MessageData> messages = [];
  Timer? starTimer;
  Timer? gameTimer;

  final List<String> gratitudePrompts = [
    'Someone who made you smile',
    'A place you feel peaceful',
    'Something that made today better',
    'A moment of joy',
    'Something you learned',
    'A kindness you received',
  ];

  @override
  void initState() {
    super.initState();
    starTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        stars.add(StarData(
          id: DateTime.now().millisecondsSinceEpoch,
          x: Random().nextDouble() * 0.9,
          y: Random().nextDouble() * 0.9,
          prompt: gratitudePrompts[Random().nextInt(gratitudePrompts.length)],
        ));
      });
    });

    gameTimer = Timer(const Duration(seconds: 35), () {
      starTimer?.cancel();
      Navigator.pop(context, collected * 25);
    });
  }

  void _collectStar(StarData star) {
    setState(() {
      stars.removeWhere((s) => s.id == star.id);
      collected++;
      messages.add(MessageData(id: star.id, text: star.prompt));
    });

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          messages.removeWhere((m) => m.id == star.id);
        });
      }
    });
  }

  @override
  void dispose() {
    starTimer?.cancel();
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF312E81), Color(0xFF7E22CE), Color(0xFFDB2777)],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Collect stars and reflect on what you\'re grateful for',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...stars.map((star) => Positioned(
              left: MediaQuery.of(context).size.width * star.x,
              top: MediaQuery.of(context).size.height * star.y,
              child: GestureDetector(
                onTap: () => _collectStar(star),
                child: Icon(
                  Icons.star,
                  size: 48,
                  color: Colors.yellow.shade300,
                ),
              ),
            )),
            if (messages.isNotEmpty)
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Text(
                    messages.last.text,
                    style: const TextStyle(
                      color: Color(0xFF9333EA),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    '✨ $collected Gratitudes',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                  backgroundColor: Colors.white.withOpacity(0.2),
                  foregroundColor: Colors.white,
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

class StarData {
  final int id;
  final double x;
  final double y;
  final String prompt;

  StarData({
    required this.id,
    required this.x,
    required this.y,
    required this.prompt,
  });
}

class MessageData {
  final int id;
  final String text;

  MessageData({required this.id, required this.text});
}