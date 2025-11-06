import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:audioplayers/audioplayers.dart';
import 'sleep_meditation_flow.dart';
import 'foundations_onboarding.dart';

// Final clean implementation. No duplicated classes or stray characters.

class PlanOverviewScreen extends StatefulWidget {
  const PlanOverviewScreen({super.key, this.initialDay = 1});
  final int initialDay;
  @override
  State<PlanOverviewScreen> createState() => _PlanOverviewScreenState();
}

class _PlanOverviewScreenState extends State<PlanOverviewScreen> {
  String selectedInstructor = 'Ofosu';
  late int activeDay;
  final Map<int, String> _dayTitles = {
    1: 'Basics of Breath Focus',
    2: 'Benefits of Breath Focus',
    3: 'Meditation and your brain',
    4: 'Foundations: Posture',
    5: 'Foundations: Attention',
    6: 'Foundations: Body Scan',
    7: 'Foundations: Mindfulness Practice',
    8: 'Foundations: Deeper Breath',
    9: 'Foundations: Compassion',
    10: 'Foundations: Integration',
  };

  @override
  void initState() {
    super.initState();
    activeDay = widget.initialDay;
  }

  void _showInstructorPicker() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            const Text('Select Coach', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Ofosu'),
              trailing: selectedInstructor == 'Ofosu' ? const Icon(Icons.check, color: Color(0xFF14B8A6)) : null,
              onTap: () {
                setState(() => selectedInstructor = 'Ofosu');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Leah'),
              trailing: selectedInstructor == 'Leah' ? const Icon(Icons.check, color: Color(0xFF14B8A6)) : null,
              onTap: () {
                setState(() => selectedInstructor = 'Leah');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildDayItem(int dayNumber, String title, bool completed) {
    final active = dayNumber == activeDay;
    return ListTile(
      leading: CircleAvatar(backgroundColor: active ? const Color(0xFF14B8A6) : const Color(0xFFE0E0E0), child: Icon(Icons.play_arrow, color: active ? Colors.white : Colors.grey[700])),
      title: Text(title, style: TextStyle(color: active ? Colors.black : Colors.grey[700])),
      subtitle: Text('DAY $dayNumber'),
      trailing: completed ? const Icon(Icons.check, color: Color(0xFF14B8A6)) : null,
      onTap: () => setState(() => activeDay = dayNumber),
    );
  }

  Widget _buildCard(String title, IconData icon, {String? assetPath}) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          if (title == 'Sleep') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SleepFlowRoot()));
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title tapped')));
        },
        child: Container(
          height: 200,
          decoration: const BoxDecoration(color: Color(0xFF3A4458)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600), textAlign: TextAlign.left),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: assetPath != null
                      ? Image.asset(assetPath, width: double.infinity, height: double.infinity, fit: BoxFit.contain, alignment: Alignment.center, errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFF232B3A), child: const Center(child: Icon(Icons.broken_image, color: Colors.white24, size: 28))))
                      : Center(child: Icon(icon, color: const Color(0xFF5CD4D4), size: 48)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Foundations'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: Image.asset('assets/images/icons/foundations.jpg', width: 180, height: 180, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 80))),
          const SizedBox(height: 12),
          const Text('Foundations', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text('Instructor: $selectedInstructor', textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _showInstructorPicker, child: const Text('Choose coach')),
          const SizedBox(height: 16),
          ...List.generate(10, (index) {
            final day = index + 1;
            final title = _dayTitles[day] ?? 'Day $day';
            // mark first three as completed sample; adjust as needed
            final completed = day <= 3;
            return _buildDayItem(day, title, completed);
          }),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF14B8A6)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoundationsOnboardingScreen(selectedDay: activeDay))),
            child: Text('Begin Day $activeDay'),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, this.selectedDay = 1});
  final int selectedDay;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Welcome', style: TextStyle(fontSize: 28)), const SizedBox(height: 24), ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OnboardingScreen(step: 1, selectedDay: selectedDay))), child: const Text('Start'))])),
            ],
          ),
        ),
      );
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, required this.step, this.selectedDay = 1});
  final int step;
  final int selectedDay;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Onboarding step $step'), const SizedBox(height: 24), ElevatedButton(onPressed: () {
              if (step < 11) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen(step: step + 1, selectedDay: selectedDay)));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoadingScreen(selectedDay: selectedDay)));
              }
            }, child: const Text('Next'))]),
          ),
        ),
      );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.selectedDay = 1});
  final int selectedDay;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Preparing...'), const SizedBox(height: 24), ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerScreen(selectedDay: selectedDay))), child: const Text('Continue'))])),
        ),
      );
}

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, this.selectedDay = 1});
  final int selectedDay;
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;
  double _volume = 1.0;

  final String _day1AbsolutePath = r"C:\Users\Khushi\OneDrive\Desktop\task\assets\audio\day 1.mp3";

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((d) => setState(() => _duration = d));
    _audioPlayer.onPositionChanged.listen((p) => setState(() => _position = p));
    _audioPlayer.onPlayerComplete.listen((_) => setState(() { isPlaying = false; _position = _duration; }));
    if (widget.selectedDay == 1) WidgetsBinding.instance.addPostFrameCallback((_) => _startDay1Audio());
  }

  @override
  void dispose() { _audioPlayer.dispose(); super.dispose(); }

  Future<void> _startDay1Audio() async {
    debugPrint('[Player] Attempting to start Day 1 audio...');
    try {
      if (kIsWeb) {
        final url = 'assets/audio/day 1.mp3';
        await _audioPlayer.setSource(UrlSource(url));
        await _audioPlayer.setVolume(_volume);
        await _audioPlayer.resume();
        setState(() => isPlaying = true);
        debugPrint('[Player] Playing via UrlSource on web');
        return;
      }
      final f = File(_day1AbsolutePath);
      if (await f.exists()) {
        await _audioPlayer.setSource(DeviceFileSource(_day1AbsolutePath));
        await _audioPlayer.setVolume(_volume);
        await _audioPlayer.resume();
        setState(() => isPlaying = true);
        return;
      }
      final data = await rootBundle.load('assets/audio/day 1.mp3');
      final bytes = data.buffer.asUint8List();
      await _audioPlayer.setSource(BytesSource(bytes));
      await _audioPlayer.setVolume(_volume);
      await _audioPlayer.resume();
      setState(() => isPlaying = true);
    } catch (e) {
      debugPrint('[Player] Error starting audio: $e');
    }
  }

  String _format(Duration d) {
    final mm = d.inMinutes.remainder(60).toString().padLeft(2,'0');
    final ss = d.inSeconds.remainder(60).toString().padLeft(2,'0');
    return '${d.inHours>0?d.inHours.toString()+':':''}$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)), const Text('Foundations', style: TextStyle(color: Colors.white)), const SizedBox(width:48)]),
            const SizedBox(height:12),
            Expanded(child: Center(child: SizedBox(width: double.infinity, height: 220, child: const Center(child: Floating3DLine())))),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [IconButton(icon: const Icon(Icons.replay_10, color: Colors.white), onPressed: (){}), const SizedBox(width:24), GestureDetector(onTap: () async {
              if (isPlaying) { await _audioPlayer.pause(); setState(() => isPlaying = false); } else { if (_position==Duration.zero && _duration==Duration.zero && widget.selectedDay==1) await _startDay1Audio(); else await _audioPlayer.resume(); setState(() => isPlaying = true); }
            }, child: Container(width:80,height:80,decoration: BoxDecoration(color: Colors.grey[800],shape: BoxShape.circle), child: Icon(isPlaying?Icons.pause:Icons.play_arrow,color: Colors.white,size:40))), const SizedBox(width:24), IconButton(icon: const Icon(Icons.forward_10, color: Colors.white), onPressed: (){})]),
            Padding(padding: const EdgeInsets.symmetric(horizontal:24, vertical:20), child: Column(children: [
              GestureDetector(behavior: HitTestBehavior.translucent, onTapDown: (details) async { final box = context.findRenderObject() as RenderBox; final dx = details.localPosition.dx.clamp(0.0, box.size.width); final fraction = dx/box.size.width; final total = _duration.inMilliseconds>0?_duration.inMilliseconds:1; final seekMs = (fraction*total).round(); await _audioPlayer.seek(Duration(milliseconds:seekMs)); }, child: Container(height:24, alignment: Alignment.centerLeft, child: Stack(children:[Container(height:4, decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(2))), FractionallySizedBox(widthFactor: (_duration.inMilliseconds>0)?(_position.inMilliseconds/_duration.inMilliseconds).clamp(0.0,1.0):0.0, child: Container(height:4, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2))))]))),
            const SizedBox(height:8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(_format(_position), style: const TextStyle(color: Colors.white)), Row(children:[IconButton(icon: Icon(_volume==0?Icons.volume_off:Icons.volume_up, color: Colors.white), onPressed: () async { _volume = _volume==0?1.0:0.0; await _audioPlayer.setVolume(_volume); setState((){}); }), const SizedBox(width:8), Text(_format(_duration), style: const TextStyle(color: Colors.white))])])
            ])),
            const SizedBox(height:20),
            GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportScreen(selectedDay: widget.selectedDay))), child: Container(padding: const EdgeInsets.symmetric(vertical:20), child: const Text('TAP TO CONTINUE', style: TextStyle(color: Colors.grey)))),
            const SizedBox(height:8),
          ],
        ),
      ),
    );
  }
}

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key, this.selectedDay = 1});
  final int selectedDay;
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.black, body: SafeArea(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Day $selectedDay Report', style: const TextStyle(color: Colors.white, fontSize: 28)), const SizedBox(height:16), ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CompletionScreen())), child: const Text('Finish'))]))));
}

class CompletionScreen extends StatelessWidget { const CompletionScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.black, body: SafeArea(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Nice job today, KHUSHI.', style: TextStyle(color: Colors.white, fontSize: 28)), const SizedBox(height:24), ElevatedButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), child: const Text('Continue'))])))); }

// Custom Painters and Widgets

class SquigglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.7,
      size.width * 0.8,
      size.height * 0.5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF14B8A6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();
    path.moveTo(0, size.height / 2);

    for (double x = 0; x < size.width; x += 10) {
      final y = size.height / 2 +
          math.sin((x / size.width) * 4 * math.pi) * 30 +
          math.sin((x / size.width) * 8 * math.pi) * 10;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Floating3DLine extends StatefulWidget {
  const Floating3DLine({super.key});
  @override
  State<Floating3DLine> createState() => _Floating3DLineState();
}

class _Floating3DLineState extends State<Floating3DLine> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override void initState() { super.initState(); _controller = AnimationController(vsync: this, duration: const Duration(seconds:3))..repeat(); }
  @override void dispose() { _controller.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) { return AnimatedBuilder(animation: _controller, builder: (context, _) { final t = _controller.value; final translateY = math.sin(t*2*math.pi)*8.0; final tilt = math.sin(t*2*math.pi)*0.08; final matrix = Matrix4.identity()..setEntry(3,2,0.001)..rotateX(tilt)..translate(0.0, translateY); return Transform(transform: matrix, alignment: Alignment.center, child: SizedBox(width: MediaQuery.of(context).size.width, height:120, child: CustomPaint(painter: FloatingLinePainter(animationValue: t)))); }); }
}

class FloatingLinePainter extends CustomPainter {
  FloatingLinePainter({required this.animationValue}); final double animationValue;
  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height/2;
    final shadowPaint = Paint()..color = Colors.black.withOpacity(0.35)..style = PaintingStyle.stroke..strokeWidth = 10.0..maskFilter = const MaskFilter.blur(BlurStyle.normal,6);
    final path = Path();
    final amplitude = 12.0;
    path.moveTo(0, centerY);
    for (double x=0;x<=size.width;x+=8) {
      final phase = (x/size.width)*2*math.pi + (animationValue*2*math.pi);
      final y = centerY + math.sin(phase)*amplitude*math.sin(animationValue*math.pi);
      path.lineTo(x,y);
    }
    final paint = Paint()..color = const Color(0xFF14B8A6)..style = PaintingStyle.stroke..strokeWidth = 4.0..strokeCap = StrokeCap.round;
    canvas.save(); canvas.translate(0,6); canvas.drawPath(path, shadowPaint); canvas.restore(); canvas.drawPath(path, paint);
  }
  @override bool shouldRepaint(covariant FloatingLinePainter old) => old.animationValue != animationValue;
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final hourHandPaint = Paint()..color = Colors.black..strokeWidth = 2.5..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(center.dx + size.width * 0.2, center.dy), hourHandPaint);
    final minuteHandPaint = Paint()..color = Colors.black..strokeWidth = 2.0..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(center.dx, center.dy - size.height * 0.25), minuteHandPaint);
    final dotPaint = Paint()..color = Colors.black..style = PaintingStyle.fill;
    canvas.drawCircle(center, 3, dotPaint);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AnimatedWaveBar extends StatefulWidget {
  const AnimatedWaveBar({super.key, required this.delay});
  final int delay;
  @override State<AnimatedWaveBar> createState() => _AnimatedWaveBarState();
}

class _AnimatedWaveBarState extends State<AnimatedWaveBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override void initState() { super.initState(); _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true); _animation = Tween<double>(begin: 20, end: 60).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); Future.delayed(Duration(milliseconds: widget.delay), () { if (mounted) _controller.forward(); }); }
  @override void dispose() { _controller.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => AnimatedBuilder(animation: _animation, builder: (context, child) => Container(width:4, height: _animation.value, decoration: BoxDecoration(color: const Color(0xFF14B8A6), borderRadius: BorderRadius.circular(2)),), );
}

