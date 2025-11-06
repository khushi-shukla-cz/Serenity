import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;

// Midday Reset meditation flow widgets

class MiddayResetIntro extends StatelessWidget {
  const MiddayResetIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: MeditationIllustration(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Midday Reset',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Take a quick break to help you feel recharged for the rest of your day.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4E6),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(Icons.access_time, size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '3 min',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(width: 80),
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F4F8),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        'https://via.placeholder.com/80',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person, size: 40, color: Colors.black);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ofosu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OnboardingFlow()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Begin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class MeditationIllustration extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw coffee cup
    paint.color = Colors.black;
    final cupRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(50, size.height * 0.6, 100, 80),
      const Radius.circular(8),
    );
    canvas.drawRRect(cupRect, paint);

    // Draw steam
    paint.color = const Color(0xFFF5E6D3);
    final steamPath = Path();
    steamPath.moveTo(100, size.height * 0.6);
    steamPath.quadraticBezierTo(80, size.height * 0.4, 100, size.height * 0.3);
    steamPath.quadraticBezierTo(120, size.height * 0.35, 100, size.height * 0.6);
    canvas.drawPath(steamPath, paint);

    // Draw sun
    paint.color = const Color(0xFF00BCD4);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.25), 40, paint);

    // Draw landscape
    paint.color = const Color(0xFFB2DFDB);
    final landscapePath = Path();
    landscapePath.moveTo(0, size.height * 0.7);
    landscapePath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.5,
      size.width,
      size.height * 0.7,
    );
    landscapePath.lineTo(size.width, size.height);
    landscapePath.lineTo(0, size.height);
    canvas.drawPath(landscapePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({Key? key}) : super(key: key);

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / 3,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00BCD4)),
            minHeight: 4,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() => _currentPage = page);
              },
              children: [
                _buildPage1(),
                _buildPage2(),
                _buildPage3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Taking a break in between tasks helps boost your productivity.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Text(
              'TAP TO CONTINUE',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF00BCD4),
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ).withTapToContinue(
      onTap: () => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }

  Widget _buildPage2() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'It can also help you feel energized for the second half of your day.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Text(
              'TAP TO CONTINUE',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF00BCD4),
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ).withTapToContinue(
      onTap: () => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    );
  }

  Widget _buildPage3() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Would you like to set a daily reminder to use this meditation?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reminder',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '12:00 pm',
                    style: TextStyle(fontSize: 18, color: Color(0xFF00BCD4)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetSettledScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Set a reminder',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetSettledScreen()),
                );
              },
              child: const Text(
                'Not now',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class GetSettledScreen extends StatelessWidget {
  const GetSettledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CloseEyesScreen()),
      );
    });

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Get settled.',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class CloseEyesScreen extends StatelessWidget {
  const CloseEyesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MeditationPlayer()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Close your eyes',
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'and we\'ll begin.',
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MeditationPlayer extends StatefulWidget {
  const MeditationPlayer({Key? key}) : super(key: key);

  @override
  State<MeditationPlayer> createState() => _MeditationPlayerState();
}

class _MeditationPlayerState extends State<MeditationPlayer> with SingleTickerProviderStateMixin {
  late AnimationController _waveController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isLoading = true;
  bool _isTimerMode = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    
    // Setup audio and start playing
    _setupAudio();
  }

  void _setupAudio() async {
    try {
      setState(() => _isLoading = true);
      print('Setting up audio with file: audio/midday reset.mp3');
      print('Platform: ${kIsWeb ? "Web" : "Desktop"}');
      
      // Configure audio player for web compatibility
      if (kIsWeb) {
        await _audioPlayer.setAudioContext(
          AudioContext(
            android: const AudioContextAndroid(
              isSpeakerphoneOn: false,
              stayAwake: false,
              contentType: AndroidContentType.music,
              usageType: AndroidUsageType.media,
              audioFocus: AndroidAudioFocus.gain,
            ),
            iOS: AudioContextIOS(
              category: AVAudioSessionCategory.playback,
              options: {
                AVAudioSessionOptions.mixWithOthers,
              },
            ),
          ),
        );
      }
      
      // Try to set the audio source using the exact file path
      try {
        await _audioPlayer.setSource(AssetSource('audio/midday reset.mp3'));
        print('Audio source set successfully');
      } catch (sourceError) {
        print('Failed to set audio source: $sourceError');
        // Try alternative approach for web
        if (kIsWeb) {
          throw sourceError; // Let it fall through to fallback
        }
        rethrow;
      }
      
      // Listen for duration changes
      _audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          _duration = duration;
          _isLoading = false;
          print('Audio duration loaded: ${_formatDuration(duration)}');
        });
      });
      
      // Listen for position changes
      _audioPlayer.onPositionChanged.listen((position) {
        setState(() => _position = position);
      });
      
      // Listen for player state changes
      _audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() => _isPlaying = state == PlayerState.playing);
        print('Player state changed: $state');
        
        if (state == PlayerState.completed) {
          _onMeditationComplete();
        }
      });
      
      // Wait a bit longer for audio to be prepared
      await Future.delayed(const Duration(milliseconds: 1500));
      
      // Try to get the duration first, if it's still zero, force set it
      if (_duration == Duration.zero) {
        print('Duration not loaded automatically, setting fallback duration');
        setState(() {
          _duration = const Duration(minutes: 5, seconds: 59);
          _isLoading = false;
        });
      }
      
      await _audioPlayer.resume();
      print('Audio playback started');
      
    } catch (e) {
      print('Error loading audio: $e');
      // Set fallback duration to 5:59 if audio fails to load
      setState(() {
        _duration = const Duration(minutes: 5, seconds: 59);
        _isLoading = false;
        _isPlaying = false;
      });
      _startFallbackTimer();
      
      // On web, show a user-friendly message
      if (kIsWeb && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Audio playback not supported on this platform. Timer mode activated.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _startFallbackTimer() {
    print('Starting fallback timer mode');
    setState(() {
      _isTimerMode = true;
      _startTime = DateTime.now();
    });
    
    // Simulate audio progress with timer
    _simulateAudioProgress();
    
    // Use 5:59 duration as specified by user
    Future.delayed(const Duration(minutes: 5, seconds: 59), () {
      if (mounted) _onMeditationComplete();
    });
  }

  void _simulateAudioProgress() {
    if (!_isTimerMode) return;
    
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _isTimerMode && _isPlaying && _startTime != null) {
        final elapsed = DateTime.now().difference(_startTime!);
        setState(() {
          _position = elapsed;
        });
        _simulateAudioProgress();
      }
    });
  }

  void _onMeditationComplete() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CompletionScreen()),
    );
  }

  void _togglePlayPause() async {
    try {
      if (_isTimerMode || _duration == Duration.zero) {
        print('Using timer mode for play/pause');
        setState(() {
          _isPlaying = !_isPlaying;
          if (_isPlaying && _startTime == null) {
            _startTime = DateTime.now();
          } else if (_isPlaying && _startTime != null) {
            // Resume: adjust start time for elapsed pause
            final pausedDuration = _position;
            _startTime = DateTime.now().subtract(pausedDuration);
          }
        });
        
        if (_isPlaying) {
          _waveController.repeat();
          _simulateAudioProgress();
        } else {
          _waveController.stop();
        }
        return;
      }

      if (_isPlaying) {
        await _audioPlayer.pause();
        _waveController.stop();
        print('Audio paused');
      } else {
        await _audioPlayer.resume();
        _waveController.repeat();
        print('Audio resumed');
      }
    } catch (e) {
      print('Error toggling play/pause: $e');
      // Fallback to timer mode if audio fails
      setState(() {
        _isPlaying = !_isPlaying;
        _isTimerMode = true;
        if (_isPlaying && _startTime == null) {
          _startTime = DateTime.now();
        }
      });
      if (_isPlaying) {
        _waveController.repeat();
        _simulateAudioProgress();
      } else {
        _waveController.stop();
      }
    }
  }

  void _seekTo(Duration position) async {
    try {
      if (_isTimerMode) {
        print('Seeking in timer mode to: ${_formatDuration(position)}');
        setState(() {
          _position = position;
          if (_startTime != null) {
            _startTime = DateTime.now().subtract(position);
          }
        });
        return;
      }
      
      await _audioPlayer.seek(position);
      print('Seeked to: ${_formatDuration(position)}');
    } catch (e) {
      print('Error seeking: $e');
      // Fallback to timer mode seeking
      setState(() {
        _position = position;
        _isTimerMode = true;
        if (_startTime != null) {
          _startTime = DateTime.now().subtract(position);
        }
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _waveController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Icon(Icons.favorite_border, color: Colors.white, size: 28),
                ],
              ),
              const SizedBox(height: 40),
              
              // Wave animation
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _waveController,
                    builder: (context, child) {
                      return CustomPaint(
                        size: const Size(300, 200),
                        painter: WaveAnimationPainter(_isPlaying ? _waveController.value : 0.0),
                      );
                    },
                  ),
                ),
              ),
              
              // Title and info
              const Text(
                'Midday Reset',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Single • 5:59 min',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              
              // Progress bar
              Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFF00BCD4),
                      inactiveTrackColor: Colors.grey[800],
                      thumbColor: const Color(0xFF00BCD4),
                      overlayColor: const Color(0xFF00BCD4).withOpacity(0.2),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
                ],
              ),
              const SizedBox(height: 32),
              
              // Play/Pause button
              GestureDetector(
                onTap: _isLoading ? null : _togglePlayPause,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: _isLoading ? Colors.grey : const Color(0xFF00BCD4),
                    shape: BoxShape.circle,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveAnimationPainter extends CustomPainter {
  final double animationValue;
  
  WaveAnimationPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00BCD4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final centerY = size.height / 2;
    final path = Path();

    for (int i = 0; i < 3; i++) {
      final waveOffset = animationValue * 2 * math.pi + (i * 0.5);
      path.reset();
      
      for (double x = 0; x <= size.width; x++) {
        final y = centerY + 
            math.sin((x / size.width) * 4 * math.pi + waveOffset) * 20 * (1 - i * 0.3) +
            math.sin((x / size.width) * 2 * math.pi + waveOffset * 1.5) * 10 * (1 - i * 0.2);
        
        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      
      paint.color = Color(0xFF00BCD4).withOpacity(1 - i * 0.3);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Nice job today,\nKHUSHI.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 80),
              // Week calendar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDayIndicator('M', false),
                  const SizedBox(width: 12),
                  _buildDayIndicator('T', false),
                  const SizedBox(width: 12),
                  _buildDayIndicator('W', true),
                  const SizedBox(width: 12),
                  _buildDayIndicator('T', true, isToday: true),
                  const SizedBox(width: 12),
                  _buildDayIndicator('F', false),
                  const SizedBox(width: 12),
                  _buildDayIndicator('S', false),
                  const SizedBox(width: 12),
                  _buildDayIndicator('S', false),
                ],
              ),
              const SizedBox(height: 80),
              const Text(
                'Come back tomorrow, or explore your\nother recommendations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Return to main screen
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BCD4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayIndicator(String day, bool isCompleted, {bool isToday = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 14,
            color: isToday ? Colors.white : Colors.grey,
            fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: isToday ? 52 : 44,
          height: isToday ? 52 : 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? const Color(0xFF00BCD4) : Colors.transparent,
            border: Border.all(
              color: isToday
                  ? Colors.white
                  : (isCompleted ? const Color(0xFF00BCD4) : Colors.grey[800]!),
              width: isToday ? 3 : 2,
            ),
          ),
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white, size: 24)
              : null,
        ),
      ],
    );
  }
}

// Extension to add tap to continue functionality
extension TapToContinue on Widget {
  Widget withTapToContinue({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }
}