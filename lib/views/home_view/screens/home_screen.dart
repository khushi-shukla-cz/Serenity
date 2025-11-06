import 'package:flutter/material.dart';

import '../painters/along_river_illustration_painter.dart';
import '../painters/dream_scenes_illustration_painter.dart';
import '../painters/foundations_illustration_painter.dart';
import '../painters/joy_illustration_painter.dart';
import '../painters/loving_kindness_illustration_painter.dart';
// ...existing imports
import '../painters/rain_illustration_painter.dart';
import '../painters/reflection_illustration_painter.dart';
import '../painters/self_esteem_illustration_painter.dart';
import '../painters/train_illustration_painter.dart';
import '../painters/window_illustration_painter.dart';
import 'meditation_flow_screens.dart';
import 'sleep_meditation_flow.dart';
import 'midday_reset_flow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Today', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black)),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: const BoxDecoration(color: Color(0xFF3FC9C9), borderRadius: BorderRadius.zero),
                        child: const Text('GET 40% OFF', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.search, size: 28, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 380,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 32),
                                const Text('Breathe', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                                const SizedBox(height: 4),
                                const Text('Single', style: TextStyle(fontSize: 18, color: Color(0xFF9E9E9E), fontWeight: FontWeight.w400)),
                                const SizedBox(height: 32),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/icons/breathe.jpg',
                                        width: double.infinity,
                                        height: 220,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[200],
                                          alignment: Alignment.center,
                                          child: const Icon(Icons.broken_image, color: Colors.grey, size: 32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF3FC9C9),
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        elevation: 0,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.play_arrow, color: Colors.white, size: 24),
                                          SizedBox(width: 8),
                                          Text('Start', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 32),
                                const Text('Day 2 of 10', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                                const SizedBox(height: 4),
                                const Text('Foundations Plan', style: TextStyle(fontSize: 18, color: Color(0xFF9E9E9E), fontWeight: FontWeight.w400)),
                                const SizedBox(height: 32),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/icons/foundations.jpg',
                                        width: double.infinity,
                                        height: 220,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[200],
                                          alignment: Alignment.center,
                                          child: const Icon(Icons.broken_image, color: Colors.grey, size: 32),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: SizedBox(
                                    width: double.infinity,
                                      child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const PlanOverviewScreen(initialDay: 1),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF3FC9C9),
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        elevation: 0,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.play_arrow, color: Colors.white, size: 24),
                                          SizedBox(width: 8),
                                          Text('Start', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Daily Meditation', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                        child: Row(
                          children: [
                            const Expanded(child: Text('Check in with your\nmood and meditate', style: TextStyle(fontSize: 16, color: Color(0xFF9E9E9E), height: 1.5))),
                            SizedBox(
                              width: 80,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/daily_meditation.jpg',
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 60,
                                  errorBuilder: (context, error, stack) => Container(
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Recently Played', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlanOverviewScreen(initialDay: 1),
                                ),
                              );
                            },
                            child: Container(
                              width: 220,
                              height: 200,
                              decoration: const BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  const SizedBox(height: 24),
                                  const Text('Foundations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/icons/foundations.jpg',
                                          width: double.infinity,
                                          height: 140,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stack) => Container(
                                            color: Colors.grey[100],
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              // Open the sleep flow. After the flow closes, return to Today screen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SleepFlowRoot()),
                              );
                            },
                            child: Container(
                              width: 220,
                              height: 200,
                              decoration: const BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  const SizedBox(height: 24),
                                  const Text('Sleep', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                  const SizedBox(height: 4),
                                  const Text('Sleep Single • 1 hr', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/icons/sleep.jpg',
                                          width: double.infinity,
                                          height: 140,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stack) => Container(
                                            color: Colors.grey[100],
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                          ),
                                        ),
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
                    const SizedBox(height: 24),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Afternoon Recharge', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMeditationCard(context, 'Midday Reset', 'Single • 10 min', isJoy: true, width: 220),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: const Column(
                              children: [
                                SizedBox(height: 24),
                                Text('Walking', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                Expanded(
                                  child: Center(
                                    child: Icon(Icons.directions_walk, size: 64, color: Color(0xFF3FC9C9)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: const Column(
                              children: [
                                SizedBox(height: 24),
                                Text('Energize', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                Expanded(
                                  child: Center(
                                    child: Icon(Icons.bolt, size: 64, color: Color(0xFFFFC107)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Favorites', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlanOverviewScreen(initialDay: 1),
                                ),
                              );
                            },
                            child: Container(
                              width: 220,
                              height: 200,
                              decoration: const BoxDecoration(color: Colors.white),
                              child: Column(
                                children: [
                                  const SizedBox(height: 24),
                                  const Text('Foundations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/icons/foundations.jpg',
                                          width: double.infinity,
                                          height: 140,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stack) => Container(
                                            color: Colors.grey[100],
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.broken_image, color: Colors.grey, size: 28),
                                          ),
                                        ),
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
                    const SizedBox(height: 24),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Feel Happier', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                const Text('Joy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Single • 5 min', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/joy.jpg',
                                        width: double.infinity,
                                        height: 140,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 140,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 16),
                                const Text('Loving-Kindness', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Single • 5 min', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/loving_kindness.jpg',
                                        width: double.infinity,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                const Text('Self-Esteem', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Single • 3 min', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/esteem.jpg',
                                        width: double.infinity,
                                        height: 60,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Bedtime', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black))),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                const Text('Rain', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Sleep Sound • 10 hr', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/rain.jpg',
                                        width: double.infinity,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                const Text('Dream Scenes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Sleep Single • 20 min', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/dream.jpg',
                                        width: double.infinity,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 220,
                            height: 200,
                            decoration: const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                const SizedBox(height: 24),
                                const Text('Along the River', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87), textAlign: TextAlign.center),
                                const SizedBox(height: 4),
                                const Text('Sleep Journey • 30 min', style: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/icons/river.jpg',
                                        width: double.infinity,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stack) => Container(
                                          color: Colors.grey[100],
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.broken_image, color: Colors.grey, size: 20),
                                              const SizedBox(height: 6),
                                              Text(
                                                error.toString(),
                                                style: const TextStyle(fontSize: 10, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                        child: Column(
                          children: [
                            const Text("Unlock Balance's meditations, sleep stories, and more.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFF757575), height: 1.5)),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3FC9C9), padding: const EdgeInsets.symmetric(vertical: 16), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), elevation: 0),
                                  child: const Text('Unlock Balance', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  // _buildFeaturedCard was removed because featured cards are now built inline where used.

  Widget _buildMeditationCard(BuildContext context, String title, String subtitle, {bool isFoundations = false, bool isSleep = false, bool isReflection = false, bool isTrain = false, bool isJoy = false, bool isLovingKindness = false, bool isSelfEsteem = false, bool isRain = false, bool isDreamScenes = false, bool isAlongRiver = false, bool isFullWidth = false, double width = 160}) => GestureDetector(
      onTap: () {
        if (title == 'Midday Reset') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MiddayResetIntro()),
          );
        }
      },
      child: Container(
        width: isFullWidth ? double.infinity : width,
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
              child: Center(
                child: CustomPaint(
                  size: const Size(120, 120),
                  painter: _getCardPainter(
                    isFoundations: isFoundations,
                    isSleep: isSleep,
                    isReflection: isReflection,
                    isTrain: isTrain,
                    isJoy: isJoy,
                    isLovingKindness: isLovingKindness,
                    isSelfEsteem: isSelfEsteem,
                    isRain: isRain,
                    isDreamScenes: isDreamScenes,
                    isAlongRiver: isAlongRiver,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  CustomPainter _getCardPainter({bool isFoundations = false, bool isSleep = false, bool isReflection = false, bool isTrain = false, bool isJoy = false, bool isLovingKindness = false, bool isSelfEsteem = false, bool isRain = false, bool isDreamScenes = false, bool isAlongRiver = false}) {
    if (isFoundations) return FoundationsIllustrationPainter();
    if (isSleep) return WindowIllustrationPainter();
    if (isReflection) return ReflectionIllustrationPainter();
    if (isTrain) return TrainIllustrationPainter();
    if (isJoy) return JoyIllustrationPainter();
    if (isLovingKindness) return LovingKindnessIllustrationPainter();
    if (isSelfEsteem) return SelfEsteemIllustrationPainter();
    if (isRain) return RainIllustrationPainter();
    if (isDreamScenes) return DreamScenesIllustrationPainter();
    if (isAlongRiver) return AlongRiverIllustrationPainter();
    return FoundationsIllustrationPainter();
  }
}
