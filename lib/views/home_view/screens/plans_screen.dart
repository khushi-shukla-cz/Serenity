import 'dart:math';

import 'package:flutter/material.dart';
import 'meditation_flow_screens.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            _buildSectionHeader('FAVORITES', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlanOverviewScreen(initialDay: 1),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        decoration: _cardDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('Foundations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/foundations.jpg',
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stack) => Container(
                                    color: Colors.grey[100],
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
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('RELIEVE STRESS', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Relaxation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/relaxation.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Relaxation II', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/relaxation 2.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            _buildUpgradeBanner(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Relaxation III', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/relaxation 3.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Work Stress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/workstress.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 32),
            _buildSectionHeader('FIND FOCUS', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Communication', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/communication.jpg',
                                  width: double.infinity,
                                  height: 80,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Focus', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/focus.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Productivity', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/productivity.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('SLEEP WELL', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Sleep', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/sleep_plan.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('GET SUPPORT', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Confidence', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/confidence.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Ease Loneliness', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/lonely.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Facing Fear', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/fear.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Pain', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/pain.jpg',
                                  width: double.infinity,
                                  height: 80,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Parent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/parent.jpg',
                                  width: double.infinity,
                                  height: 80,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('LIFT YOUR MOOD', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Happiness', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/happy.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Embrace Change', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/change.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Energy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/energy.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('LEARN TO MEDITATE', const Color(0xFF4DD0D0)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlanOverviewScreen(initialDay: 1),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        decoration: _cardDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('Foundations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/icons/foundations.jpg',
                                    width: double.infinity,
                                    height: 80,
                                    fit: BoxFit.contain,
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
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Foundations II', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/f2.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Foundations III', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/f3.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Foundations IV', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/f4.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Foundations V', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/f5.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionHeader('ADVANCE YOUR PRACTICE', const Color(0xFF9E9E9E)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Advanced', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/a.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Advanced II', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/a2.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Advanced III', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/a3.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Advanced IV', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/a4.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: _cardDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('Advanced V', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/icons/a5.jpg',
                                  width: double.infinity,
                                  height: 80,
                                  fit: BoxFit.contain,
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
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );

  Widget _buildSectionHeader(String title, Color color) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 1.2,
        ),
      ),
    );

  Widget _buildFullWidthCard(String title, CustomPainter painter) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 200,
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ),
            Expanded(child: CustomPaint(painter: painter, child: Container())),
          ],
        ),
      ),
    );

  Widget _buildTwoCardRow(String title1, CustomPainter painter1, String title2, CustomPainter painter2) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _buildSmallCard(title1, painter1)),
          const SizedBox(width: 16),
          Expanded(child: _buildSmallCard(title2, painter2)),
        ],
      ),
    );

  Widget _buildSmallCard(String title, CustomPainter painter) => Container(
      height: 200,
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
          Expanded(child: CustomPaint(painter: painter, child: Container())),
        ],
      ),
    );

  BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2)),
      ],
    );

  Widget _buildUpgradeBanner() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      height: 80,
      decoration: _cardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Unlock all meditations.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4DD0D0),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: const Text('UPGRADE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
          ),
        ],
      ),
    );
}

class FoundationsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.teal.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.teal.shade200;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 30, circlePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, circlePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, circlePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RelaxationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.amber.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final sunPaint = Paint()..color = Colors.amber.shade200;
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 30, sunPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Relaxation2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.blue.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final wavePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.blue.shade200;
    final wavePath = Path();
    wavePath.moveTo(0, size.height * 0.5);
    wavePath.quadraticBezierTo(size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.5);
    wavePath.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height * 0.5);
    canvas.drawPath(wavePath, wavePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Relaxation3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.purple.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final cloudPaint = Paint()..color = Colors.purple.shade100;
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 15, cloudPaint);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.3), 15, cloudPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WorkStressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.orange.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final screenPaint = Paint()..color = Colors.orange.shade200;
    canvas.drawRect(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.4), width: 50, height: 35), screenPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CommunicationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.pink.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final bubblePaint = Paint()..color = Colors.pink.shade200;
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.4), 25, bubblePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FocusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFFE8F5F5);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final targetPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = const Color(0xFF4DD0D0);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), 20, targetPaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), 35, targetPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProductivityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.green.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final checkPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.green.shade400;
    final checkPath = Path();
    checkPath.moveTo(size.width * 0.3, size.height * 0.5);
    checkPath.lineTo(size.width * 0.4, size.height * 0.6);
    checkPath.lineTo(size.width * 0.7, size.height * 0.3);
    canvas.drawPath(checkPath, checkPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SleepPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.indigo.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final moonPaint = Paint()..color = Colors.indigo.shade200;
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 25, moonPaint);
    final starPaint = Paint()..color = Colors.indigo.shade300;
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.3), 3, starPaint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.5), 3, starPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ConfidencePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.red.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final heartPaint = Paint()..color = Colors.red.shade200;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 25, heartPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LonelinessPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.blueGrey.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final circlePaint = Paint()..color = Colors.blueGrey.shade200;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.4), 15, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.4), 15, circlePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FacingFearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.deepOrange.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final shieldPaint = Paint()..color = Colors.deepOrange.shade200;
    final shieldPath = Path();
    shieldPath.moveTo(size.width * 0.5, size.height * 0.25);
    shieldPath.lineTo(size.width * 0.65, size.height * 0.35);
    shieldPath.lineTo(size.width * 0.65, size.height * 0.55);
    shieldPath.lineTo(size.width * 0.5, size.height * 0.65);
    shieldPath.lineTo(size.width * 0.35, size.height * 0.55);
    shieldPath.lineTo(size.width * 0.35, size.height * 0.35);
    shieldPath.close();
    canvas.drawPath(shieldPath, shieldPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.cyan.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final glowPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.cyan.shade200;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 25, glowPaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 40, glowPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ParentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.lime.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final bigCircle = Paint()..color = Colors.lime.shade300;
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.4), 20, bigCircle);
    final smallCircle = Paint()..color = Colors.lime.shade400;
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.5), 12, smallCircle);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HappinessPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.yellow.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final smilePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.yellow.shade700;
    final smilePath = Path();
    smilePath.moveTo(size.width * 0.3, size.height * 0.5);
    smilePath.quadraticBezierTo(size.width * 0.5, size.height * 0.7, size.width * 0.7, size.height * 0.5);
    canvas.drawPath(smilePath, smilePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EmbraceChangePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.tealAccent.shade100;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final butterflyPaint = Paint()..color = Colors.teal.shade300;
    final leftWing = Path();
    leftWing.moveTo(size.width * 0.45, size.height * 0.5);
    leftWing.quadraticBezierTo(size.width * 0.3, size.height * 0.35, size.width * 0.35, size.height * 0.55);
    leftWing.close();
    canvas.drawPath(leftWing, butterflyPaint);
    final rightWing = Path();
    rightWing.moveTo(size.width * 0.55, size.height * 0.5);
    rightWing.quadraticBezierTo(size.width * 0.7, size.height * 0.35, size.width * 0.65, size.height * 0.55);
    rightWing.close();
    canvas.drawPath(rightWing, butterflyPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EnergyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.amber.shade100;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final boltPaint = Paint()..color = Colors.amber.shade600;
    final boltPath = Path();
    boltPath.moveTo(size.width * 0.5, size.height * 0.2);
    boltPath.lineTo(size.width * 0.4, size.height * 0.5);
    boltPath.lineTo(size.width * 0.52, size.height * 0.5);
    boltPath.lineTo(size.width * 0.45, size.height * 0.8);
    boltPath.lineTo(size.width * 0.6, size.height * 0.4);
    boltPath.lineTo(size.width * 0.5, size.height * 0.4);
    boltPath.close();
    canvas.drawPath(boltPath, boltPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Foundations2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.lightBlue.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final circlePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.lightBlue.shade200;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 35, circlePaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Foundations3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.green.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final lotusPaint = Paint()..color = Colors.green.shade200;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.6), 20, lotusPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Foundations4Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.deepPurple.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final spiralPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = Colors.deepPurple.shade200;
    final spiralPath = Path();
    spiralPath.moveTo(size.width * 0.5, size.height * 0.3);
    spiralPath.quadraticBezierTo(size.width * 0.6, size.height * 0.4, size.width * 0.5, size.height * 0.5);
    spiralPath.quadraticBezierTo(size.width * 0.4, size.height * 0.6, size.width * 0.5, size.height * 0.7);
    canvas.drawPath(spiralPath, spiralPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Foundations5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = const Color(0xFFE8F5F5);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final mandalaPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = const Color(0xFF4DD0D0);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 40, mandalaPaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), 55, mandalaPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Advanced1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.brown.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final mountainPaint = Paint()..color = Colors.brown.shade200;
    final mountainPath = Path();
    mountainPath.moveTo(size.width * 0.2, size.height * 0.7);
    mountainPath.lineTo(size.width * 0.5, size.height * 0.3);
    mountainPath.lineTo(size.width * 0.8, size.height * 0.7);
    mountainPath.close();
    canvas.drawPath(mountainPath, mountainPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Advanced2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.grey.shade100;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final geoPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = const Color(0xFF4DD0D0);
    final centerX = size.width * 0.5;
    final centerY = size.height * 0.5;
    const radius = 30.0;
    for (var i = 0; i < 6; i++) {
      final angle = (i * 60) * pi / 180;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      canvas.drawLine(Offset(centerX, centerY), Offset(x, y), geoPaint);
    }
    canvas.drawCircle(Offset(centerX, centerY), 15, geoPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Advanced3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.lightGreen.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final flowPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.lightGreen.shade400;
    final flowPath = Path();
    flowPath.moveTo(size.width * 0.2, size.height * 0.5);
    flowPath.quadraticBezierTo(size.width * 0.35, size.height * 0.35, size.width * 0.5, size.height * 0.5);
    flowPath.quadraticBezierTo(size.width * 0.65, size.height * 0.65, size.width * 0.8, size.height * 0.5);
    canvas.drawPath(flowPath, flowPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Advanced4Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.deepOrange.shade50;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final infinityPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 3..color = Colors.deepOrange.shade300;
    final infinityPath = Path();
    infinityPath.moveTo(size.width * 0.3, size.height * 0.5);
    infinityPath.quadraticBezierTo(size.width * 0.4, size.height * 0.35, size.width * 0.5, size.height * 0.5);
    infinityPath.quadraticBezierTo(size.width * 0.6, size.height * 0.65, size.width * 0.7, size.height * 0.5);
    canvas.drawPath(infinityPath, infinityPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Advanced5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.indigo.shade900;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);
    final cosmicPaint = Paint()..color = Colors.yellow.shade400;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), 20, cosmicPaint);
    final orbitPaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = Colors.white24;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.35), 40, orbitPaint);
    final planetPaint = Paint()..color = const Color(0xFF4DD0D0);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.3), 5, planetPaint);
    final starPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.6), 2, starPaint);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.7), 2, starPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
