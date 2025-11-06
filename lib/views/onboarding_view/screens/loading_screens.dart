import 'dart:math';

import 'package:flutter/material.dart';

import '../../auth_view/screens/login_screen.dart';
import '../../auth_view/screens/sign_up_screen.dart';

class LoadingScreens extends StatefulWidget {
  const LoadingScreens({super.key});

  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}

class _LoadingScreensState extends State<LoadingScreens> with TickerProviderStateMixin {
  int currentScreen = 0;
  late AnimationController _rotationController;
  
  final List<Map<String, dynamic>> screens = [
    {
      'text': 'Creating program based on\nyour goals...',
      'highlightColor': const Color(0xFF8B7FE8),
      'avatarColor': const Color(0xFF8B7FE8),
      'orbitDots': [
        {'color': const Color(0xFFFFCBB3), 'size': 12.0},
        {'color': const Color(0xFFE8D5BE), 'size': 15.0},
        {'color': const Color(0xFF9ED4C8), 'size': 10.0},
        {'color': const Color(0xFFB8D9E8), 'size': 14.0},
      ]
    },
    {
      'text': 'Creating program based on\nyour experience...',
      'highlightColor': const Color(0xFFDFAD6D),
      'avatarColor': const Color(0xFFDFAD6D),
      'orbitDots': [
        {'color': const Color(0xFF9ED4C8), 'size': 15.0},
        {'color': const Color(0xFFB8D9E8), 'size': 12.0},
        {'color': const Color(0xFFFFCBB3), 'size': 10.0},
      ]
    },
    {
      'text': 'Creating program based on\nyour preferences...',
      'highlightColor': const Color(0xFF6EBFBA),
      'avatarColor': const Color(0xFF6EBFBA),
      'orbitDots': [
        {'color': const Color(0xFFFFCBB3), 'size': 12.0},
        {'color': const Color(0xFF9ED4C8), 'size': 14.0},
      ]
    },
    {
      'text': 'Creating program based on\nyour age...',
      'highlightColor': const Color(0xFF6EBFBA),
      'avatarColor': const Color(0xFFE89F6D),
      'orbitDots': [
        {'color': const Color(0xFFFFCBB3), 'size': 13.0},
        {'color': const Color(0xFFB8D9E8), 'size': 11.0},
        {'color': const Color(0xFF9ED4C8), 'size': 12.0},
      ]
    },
    {
      'text': 'Your program is ready.',
      'highlightColor': const Color(0xFFDF9A6A),
      'avatarColor': const Color(0xFFDF9A6A),
      'showAvatar': true,
      'isLast': true
    },
  ];

  @override
  void initState() {
    super.initState();
    
    // Rotation animation controller for orbiting dots
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
    
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        if (currentScreen < screens.length - 1) {
          setState(() {
            currentScreen++;
          });
          _startAnimation();
        }
        // Stop animation on last screen - don't auto-navigate
      }
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = screens[currentScreen];
    final isLastScreen = screen['isLast'] == true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Spacer(flex: 3),
                
                // Avatar with rotating dots OR static avatar with person
                if (isLastScreen)
                  // Static avatar with person icon for last screen
                  Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFDFD0),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        // Head circle
                        Align(
                          alignment: const Alignment(0, -0.25),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDF9A6A),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        // Body half circle
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 120,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDF9A6A),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  // Animated Avatar with rotating dots
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Orbiting dots
                        AnimatedBuilder(
                          animation: _rotationController,
                          builder: (context, child) {
                            final orbitDots = screen['orbitDots'] as List<Map<String, dynamic>>?;
                            if (orbitDots == null) return const SizedBox();
                            
                            return Stack(
                              alignment: Alignment.center,
                              children: List.generate(orbitDots.length, (index) {
                                final dot = orbitDots[index];
                                final angle = (_rotationController.value * 2 * pi) + (index * 2 * pi / orbitDots.length);
                                const radius = 110.0;
                                final x = radius * cos(angle);
                                final y = radius * sin(angle);
                                
                                return Transform.translate(
                                  offset: Offset(x, y),
                                  child: Container(
                                    width: dot['size'],
                                    height: dot['size'],
                                    decoration: BoxDecoration(
                                      color: dot['color'],
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: (dot['color'] as Color).withOpacity(0.4),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        
                        // Static large circle background
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: (screen['avatarColor'] as Color).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: screen['avatarColor'],
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: (screen['avatarColor'] as Color).withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                const SizedBox(height: 60),
                
                // Text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: isLastScreen
                        ? [
                            const TextSpan(
                              text: 'Your',
                              style: TextStyle(
                                color: Color(0xFFDF9A6A),
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const TextSpan(
                              text: ' program is ready.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ]
                        : _buildTextSpans(
                            screen['text'] as String,
                            screen['highlightColor'] as Color,
                          ),
                  ),
                ),
                
                const Spacer(flex: 2),
                
                // Buttons only on last screen
                if (isLastScreen) ...[
                  // Create account button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4DBEB4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 28),
                  
                  // Login text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFF4DBEB4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String text, Color highlightColor) {
    final parts = text.split('\n');
    final spans = <TextSpan>[];
    
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      final words = part.split(' ');
      
      for (var j = 0; j < words.length; j++) {
        final word = words[j];
        final isHighlighted = word.startsWith('your');
        
        spans.add(
          TextSpan(
            text: word + (j < words.length - 1 ? ' ' : ''),
            style: TextStyle(
              color: isHighlighted ? highlightColor : Colors.grey[600],
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
            ),
          ),
        );
      }
      
      if (i < parts.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }
    
    return spans;
  }
}
