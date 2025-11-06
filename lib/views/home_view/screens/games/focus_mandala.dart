import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class FocusMandala extends StatefulWidget {
  const FocusMandala({Key? key}) : super(key: key);

  @override
  State<FocusMandala> createState() => _FocusMandalaState();
}

class _FocusMandalaState extends State<FocusMandala> {
  List<SegmentData> segments = [];
  int currentIndex = 0;
  int score = 0;
  final int totalSegments = 12;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    segments = List.generate(
      totalSegments,
      (i) => SegmentData(
        id: i,
        filled: false,
        color: [Colors.purple, Colors.pink, Colors.blue, Colors.green][i % 4],
      ),
    );

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentIndex++;
        if (currentIndex >= totalSegments) {
          timer.cancel();
          Navigator.pop(context, score);
        }
      });
    });
  }

  void _fillSegment(int id) {
    if (id == currentIndex && !segments[id].filled) {
      setState(() {
        segments[id] = SegmentData(
          id: segments[id].id,
          filled: true,
          color: segments[id].color,
        );
        score += 20;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEEF2FF), Color(0xFFFAF5FF)],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Focus on the Present',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9333EA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Click each segment as it lights up',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$score points',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9333EA),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CustomPaint(
                      painter: MandalaPainter(
                        segments: segments,
                        currentIndex: currentIndex,
                        onTap: _fillSegment,
                      ),
                      child: GestureDetector(
                        onTapDown: (details) {
                          final RenderBox box = context.findRenderObject() as RenderBox;
                          final localPosition = box.globalToLocal(details.globalPosition);
                          final center = Offset(box.size.width / 2, box.size.height / 2);
                          final angle = (atan2(localPosition.dy - center.dy, localPosition.dx - center.dx) * 180 / pi + 90) % 360;
                          final segmentIndex = (angle / (360 / totalSegments)).floor();
                          _fillSegment(segmentIndex);
                        },
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
      ),
    );
  }
}

class SegmentData {
  final int id;
  final bool filled;
  final Color color;

  SegmentData({required this.id, required this.filled, required this.color});
}

class MandalaPainter extends CustomPainter {
  final List<SegmentData> segments;
  final int currentIndex;
  final Function(int) onTap;

  MandalaPainter({
    required this.segments,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    final segmentAngle = 2 * pi / segments.length;

    for (int i = 0; i < segments.length; i++) {
      final segment = segments[i];
      final startAngle = i * segmentAngle - pi / 2;
      final sweepAngle = segmentAngle;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = segment.filled
            ? segment.color
            : (i == currentIndex ? Colors.yellow.shade300 : Colors.grey.shade300);

      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..close();

      canvas.drawPath(path, paint);

      final borderPaint = Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.white
        ..strokeWidth = 2;
      canvas.drawPath(path, borderPaint);
    }

    // Center circle
    final centerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 40, centerCirclePaint);

    final centerBorderPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, 40, centerBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}