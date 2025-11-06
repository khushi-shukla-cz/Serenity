import 'package:flutter/material.dart';
import 'games/breathing_garden.dart';
import 'games/thought_clouds.dart';
import 'games/focus_mandala.dart';
import 'games/gratitude_stars.dart';
import 'games/energy_flow.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings_outlined, size: 28),
                    onPressed: () {},
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4DB8C4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'UPGRADE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile section
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFDDD2),
              ),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE8A587),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Color(0xFFD88A68),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'KHUSHI',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),

            // Tabs
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildTab('Progress', 0),
                  _buildTab('Skills', 1),
                  _buildTab('Badges', 2),
                  _buildTab('Games', 3),
                ],
              ),
            ),

            // Content
            Expanded(
              child: _selectedTab == 0
                  ? _buildProgressTab()
                  : _selectedTab == 1
                      ? _buildSkillsTab()
                      : _selectedTab == 2
                          ? _buildBadgesTab()
                          : _buildGamesTab(),
            ),
          ],
        ),
      ),
    );

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressTab() => SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Calendar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    const Text(
                      'October',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildCalendar(),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Stats
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Time trained',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '3 hr 19 min',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Daily streak',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1 day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Session History
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Session History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Add new',
                  style: TextStyle(
                    color: Color(0xFF4DB8C4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Text(
            '2025',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 16),

          // Session items
          _buildSessionItem('Personal Session', 'Custom entry', 'OCT 21'),
          _buildSessionItem('Foundations', 'Day 1 of 10', 'OCT 21'),
          _buildSessionItem('Personal Session', 'Custom entry', 'OCT 18'),
          _buildSessionItem('Foundations', 'Day 2 of 10', 'OCT 18'),
          _buildSessionItem('Sleep', 'Single', 'OCT 18'),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Foundations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Day 1 of 10',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  'OCT 16',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildCalendar() {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final dates = [
      ['', '', '1', '2', '3', '4', '5'],
      ['6', '7', '8', '9', '10', '11', '12'],
      ['13', '14', '15', '16', '17', '18', '19'],
      ['20', '21', '22', '23', '24', '25', '26'],
      ['27', '28', '29', '30', '31', '', ''],
    ];

    final highlighted = ['16', '18', '21', '22'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days
              .map((day) => SizedBox(
                    width: 40,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 12),
        ...dates.map((week) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: week.map((date) {
                  if (date.isEmpty) {
                    return const SizedBox(width: 40, height: 40);
                  }
                  final isHighlighted = highlighted.contains(date);
                  final isToday = date == '22';
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isHighlighted
                          ? const Color(0xFF4DB8C4)
                          : Colors.transparent,
                      border: isToday
                          ? Border.all(
                              color: const Color(0xFF4DB8C4),
                              width: 2,
                            )
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 16,
                          color: isHighlighted ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }

  Widget _buildSessionItem(String title, String subtitle, String date) => Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F4F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

  Widget _buildSkillsTab() => ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSkillItem('Breath Focus', 'Level 3', Icons.air, 0.6),
        _buildSkillItem('Body Scan', 'Level 3', Icons.accessibility_new, 0.2),
        _buildSkillItem('Labeling', 'Level 1', Icons.local_offer_outlined, 0),
        _buildSkillItem('Loving-Kindness', 'Level 1', Icons.favorite_border, 0),
        _buildSkillItem('Spotlighting', 'Level 1', Icons.lightbulb_outline, 0),
        _buildSkillItem('Breath Control', 'Level 1', Icons.air, 0),
        _buildSkillItem('Awareness', 'Level 1', Icons.explore_outlined, 0),
        _buildSkillItem('Visualization', 'Level 1', Icons.remove_red_eye_outlined, 0),
        _buildSkillItem('Innovation', 'Level 1', Icons.emoji_objects_outlined, 0),
        _buildSkillItem('Self-Direction', 'Level 1', Icons.star_border, 0),
      ],
    );

  Widget _buildSkillItem(String title, String level, IconData icon, double progress) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 32,
              color: const Color(0xFF4DB8C4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  level,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF4DB8C4),
                    ),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildBadgesTab() => ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildBadgeItem('Streak', 'Get a 2-day streak', Icons.calendar_today, 0.5),
        _buildBadgeItem('Time trained', 'Train for 250 minutes', Icons.access_time, 0.65),
        _buildBadgeItem('Plans', 'Complete 1 Plan', Icons.person_outline, 0),
        _buildBadgeItem('Singles', 'Play 10 Singles', Icons.grid_view, 0.1),
        _buildBadgeItem('Sleep Singles', 'Play 3 Sleep Singles', Icons.nightlight_round, 0.3),
      ],
    );

  Widget _buildBadgeItem(String title, String description, IconData icon, double progress) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 8,
                      color: index == 0 ? const Color(0xFF4DB8C4) : Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Icon(
                  icon,
                  size: 28,
                  color: const Color(0xFF4DB8C4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF4DB8C4),
                    ),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildGamesTab() => ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // Games header with stats
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4DB8C4), Color(0xFF6BC5D0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Games Played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '24',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 2,
                height: 50,
                color: Colors.white.withOpacity(0.3),
              ),
              Column(
                children: [
                  const Text(
                    'High Score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1,250',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Quick Games section
        const Text(
          'Quick Games',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),

        _buildGameItem(
          'Breathing Garden',
          'Follow your breath and grow a peaceful garden',
          Icons.local_florist,
          'Last played: 2 hours ago',
          true,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BreathingGarden())),
        ),
        _buildGameItem(
          'Thought Release',
          'Let go of worries by releasing thought clouds',
          Icons.cloud,
          'New achievement available!',
          false,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ThoughtClouds())),
        ),
        _buildGameItem(
          'Focus Mandala',
          'Practice present-moment awareness',
          Icons.psychology,
          'Best time: 2:34',
          false,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FocusMandala())),
        ),

        const SizedBox(height: 32),

        // Challenge Games section
        const Text(
          'Challenge Games',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),

        _buildGameItem(
          'Gratitude Stars',
          'Collect moments of thankfulness',
          Icons.star,
          'Streak: 5 days',
          true,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GratitudeStars())),
        ),
        _buildGameItem(
          'Energy Balance',
          'Find your inner equilibrium',
          Icons.flash_on,
          'Level 12 - Ancient Forest',
          false,
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EnergyFlow())),
        ),
        _buildGameItem(
          'Zen Garden',
          'Create your peaceful space',
          Icons.spa,
          'Garden completion: 78%',
          false,
          () {
            // Placeholder for future game
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Zen Garden coming soon!')),
            );
          },
        ),

        const SizedBox(height: 32),

        // Recent Achievements
        const Text(
          'Recent Achievements',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),

        _buildAchievementItem(
          'Memory Master',
          'Completed 10 memory games',
          Icons.emoji_events,
          '2 days ago',
        ),
        _buildAchievementItem(
          'Breathing Expert',
          'Perfect breathing rhythm for 5 minutes',
          Icons.favorite,
          '1 week ago',
        ),
        _buildAchievementItem(
          'Puzzle Solver',
          'Solved 25 mindful puzzles',
          Icons.lightbulb,
          '2 weeks ago',
        ),
      ],
    );

  Widget _buildGameItem(String title, String description, IconData icon, String status, bool isNew, VoidCallback onTap) => GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isNew ? const Color(0xFFE0F4F5) : Colors.white,
          border: Border.all(
            color: isNew ? const Color(0xFF4DB8C4) : Colors.grey.shade300,
            width: isNew ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF4DB8C4).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: const Color(0xFF4DB8C4),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isNew) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4DB8C4),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF4DB8C4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 32,
              color: const Color(0xFF4DB8C4),
            ),
          ],
        ),
      ),
    );

  Widget _buildAchievementItem(String title, String description, IconData icon, String date) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E6),
        border: Border.all(color: const Color(0xFFFFD700)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD700),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
}
