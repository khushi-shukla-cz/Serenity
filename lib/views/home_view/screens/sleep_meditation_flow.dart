import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// Sleep meditation flow widgets (standalone file). Push this route to show the sleep flow.

class SleepFlowRoot extends StatefulWidget {
  const SleepFlowRoot({Key? key}) : super(key: key);

  @override
  State<SleepFlowRoot> createState() => _SleepFlowRootState();
}

class _SleepFlowRootState extends State<SleepFlowRoot> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case 0:
        return SleepHomeScreen(onBegin: () => setState(() => currentScreen = 1));
      case 1:
        return SleepSettleScreen(onNext: () => setState(() => currentScreen = 2));
      case 2:
        return SleepCloseEyesScreen(onNext: () => setState(() => currentScreen = 3));
      case 3:
        return SleepAnimationScreen(onNext: () => setState(() => currentScreen = 4));
      case 4:
        return SleepCreatingReportScreen(onNext: () => setState(() => currentScreen = 5));
      case 5:
        return SleepAchievementScreen(onNext: () => setState(() => currentScreen = 6));
      case 6:
        return SleepBreathFocusScreen(onNext: () => setState(() => currentScreen = 7));
      case 7:
        return SleepBodyScanScreen(onNext: () => setState(() => currentScreen = 8));
      case 8:
        return SleepReportScreen();
      default:
        return SleepHomeScreen(onBegin: () => setState(() => currentScreen = 1));
    }
  }
}

class SleepHomeScreen extends StatelessWidget {
  final VoidCallback onBegin;
  const SleepHomeScreen({Key? key, required this.onBegin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.close, size: 28, color: Colors.black),
                  Icon(Icons.favorite_border, size: 28, color: Colors.black),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Small placeholder illustration
                    SizedBox(height: 200, width: 300, child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey[200]))),
                    const SizedBox(height: 32),
                    const Text('Sleep', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black)),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'When you\'re ready for bed, settle in and\ndrift to sleep with expert guidance.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(width: 80, height: 80, decoration: const BoxDecoration(color: Color(0xFFFFF4E6), shape: BoxShape.circle), child: const Icon(Icons.access_time, size: 36, color: Colors.black)),
                            const SizedBox(height: 8),
                            Row(children: const [Text('1 hr', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)), SizedBox(width: 4), Icon(Icons.keyboard_arrow_down, size: 20)]),
                          ],
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Container(width: 80, height: 80, decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/150?img=12'), fit: BoxFit.cover))),
                            const SizedBox(height: 8),
                            Row(children: const [Text('Ofosu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)), SizedBox(width: 4), Icon(Icons.keyboard_arrow_down, size: 20)]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onBegin,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF26B5B5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 0),
                  child: const Text('Begin', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SleepSettleScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepSettleScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), onNext);
    return Scaffold(backgroundColor: const Color(0xFF4A5568), body: const Center(child: Text('Get settled.', style: TextStyle(fontSize:32,color: Colors.white,fontWeight: FontWeight.w300))));
  }
}

class SleepCloseEyesScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepCloseEyesScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), onNext);
    return Scaffold(backgroundColor: const Color(0xFF4A5568), body: const Center(child: Text('Close your eyes\nand we\'ll begin.', textAlign: TextAlign.center, style: TextStyle(fontSize:32,color: Colors.white,fontWeight: FontWeight.w300,height:1.4))));
  }
}

class SleepAnimationScreen extends StatefulWidget {
  final VoidCallback onNext;
  const SleepAnimationScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  State<SleepAnimationScreen> createState() => _SleepAnimationScreenState();
}

class _SleepAnimationScreenState extends State<SleepAnimationScreen> with TickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  late AnimationController _animationController;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _setupAudio();
    _startAutoAdvanceTimer();
  }

  void _setupAudio() async {
    try {
      await _audioPlayer.setSource(AssetSource('audio/sleep.mp3'));
      
      _audioPlayer.onDurationChanged.listen((duration) {
        setState(() => _duration = duration);
      });
      
      _audioPlayer.onPositionChanged.listen((position) {
        setState(() => _position = position);
      });
      
      _audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() => _isPlaying = state == PlayerState.playing);
      });
      
      // Auto-play the audio when screen loads
      await _audioPlayer.resume();
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void _startAutoAdvanceTimer() {
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) widget.onNext();
    });
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
  }

  void _seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Animation area
            Expanded(
              flex: 3,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return SizedBox(
                      width: 300,
                      height: 200,
                      child: CustomPaint(
                        painter: _SleepWaveAnimationPainter(
                          animationValue: _animationController.value,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Audio controls
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Progress bar
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF26B5B5),
                        inactiveTrackColor: Colors.grey[800],
                        thumbColor: const Color(0xFF26B5B5),
                        overlayColor: const Color(0xFF26B5B5).withOpacity(0.2),
                        trackHeight: 2,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      ),
                      child: Slider(
                        value: _position.inSeconds.toDouble(),
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    
                    // Time labels
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_position),
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            _formatDuration(_duration),
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Play/Pause button
                    GestureDetector(
                      onTap: _togglePlayPause,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF26B5B5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SleepWaveAnimationPainter extends CustomPainter {
  final double animationValue;
  
  _SleepWaveAnimationPainter({this.animationValue = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF26B5B5)..style = PaintingStyle.stroke..strokeWidth = 3;
    
    // Animate the wave offset based on animation value
    final offset = animationValue * 20;
    
    final path1 = Path();
    path1.moveTo(0, size.height * 0.5 + offset);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.3 - offset, size.width * 0.5, size.height * 0.5 + offset);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 0.7 + offset, size.width, size.height * 0.5 - offset);
    canvas.drawPath(path1, paint);
    
    final path2 = Path();
    path2.moveTo(0, size.height * 0.55 - offset);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.35 + offset, size.width * 0.5, size.height * 0.55 - offset);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 0.75 - offset, size.width, size.height * 0.55 + offset);
    canvas.drawPath(path2, paint);
    
    // Third wave for more fluid animation
    final paint3 = Paint()..color = const Color(0xFF26B5B5).withOpacity(0.6)..style = PaintingStyle.stroke..strokeWidth = 2;
    final path3 = Path();
    path3.moveTo(0, size.height * 0.45 + offset * 0.5);
    path3.quadraticBezierTo(size.width * 0.25, size.height * 0.25 - offset * 0.5, size.width * 0.5, size.height * 0.45 + offset * 0.5);
    path3.quadraticBezierTo(size.width * 0.75, size.height * 0.65 + offset * 0.5, size.width, size.height * 0.45 - offset * 0.5);
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SleepCreatingReportScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepCreatingReportScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), onNext);
    return Scaffold(backgroundColor: Colors.black, body: Center(child: Text('Creating report...', style: TextStyle(fontSize:20,color: Colors.grey[500]))));
  }
}

class SleepAchievementScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepAchievementScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Achievement complete', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w400)),
              const SizedBox(height: 24),
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.star, color: Color(0xFF26B5B5), size: 24), Icon(Icons.star_border, color: Colors.grey, size: 24), Icon(Icons.star_border, color: Colors.grey, size: 24), Icon(Icons.star_border, color: Colors.grey, size: 24), Icon(Icons.star_border, color: Colors.grey, size: 24)]),
                    SizedBox(height: 12),
                    Icon(Icons.nightlight_round, size: 60, color: Color(0xFF26B5B5)),
                    SizedBox(height: 8),
                    Icon(Icons.auto_awesome, size: 30, color: Color(0xFF26B5B5)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Sleep Singles', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text('Play 3 Sleep Singles', style: TextStyle(fontSize: 16, color: Colors.grey[500])),
              const SizedBox(height: 20),
              TextButton(onPressed: onNext, child: const Text('TAP TO CONTINUE', style: TextStyle(fontSize: 16, color: Color(0xFF26B5B5), letterSpacing: 1.2, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    );
  }
}

class SleepBreathFocusScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepBreathFocusScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('New skill level', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400)),
              const SizedBox(height: 16),
              Container(width: 180, height: 180, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Center(child: Icon(Icons.air, size: 80, color: Color(0xFF26B5B5)))),
              const SizedBox(height: 16),
              const Text('Breath Focus', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text('Level 6', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
              const SizedBox(height: 16),
              TextButton(onPressed: onNext, child: const Text('TAP TO CONTINUE', style: TextStyle(fontSize: 16, color: Color(0xFF26B5B5), letterSpacing: 1.2, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    );
  }
}

class SleepBodyScanScreen extends StatelessWidget {
  final VoidCallback onNext;
  const SleepBodyScanScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('New skill level', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400)),
              const SizedBox(height: 16),
              Container(width: 180, height: 180, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Center(child: Icon(Icons.accessibility_new, size: 80, color: Color(0xFF26B5B5)))),
              const SizedBox(height: 16),
              const Text('Body Scan', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text('Level 3', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
              const SizedBox(height: 16),
              TextButton(onPressed: onNext, child: const Text('TAP TO CONTINUE', style: TextStyle(fontSize: 16, color: Color(0xFF26B5B5), letterSpacing: 1.2, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    );
  }
}

class SleepReportScreen extends StatefulWidget {
  const SleepReportScreen({Key? key}) : super(key: key);
  @override
  State<SleepReportScreen> createState() => _SleepReportScreenState();
}

class _SleepReportScreenState extends State<SleepReportScreen> {
  @override
  void initState() {
    super.initState();
    // Auto-close the flow after a short delay so callers (Home) can react and open the Sleep screen
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Sleep session complete', style: TextStyle(color: Colors.white, fontSize: 28)),
                SizedBox(height: 8),
                Text('Good night.', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      );
}
