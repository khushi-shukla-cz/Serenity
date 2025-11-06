 import 'package:flutter/material.dart';
 import 'sleep_meditation_flow.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF1A1D28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D28),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'FALL ASLEEP',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Sleep', Icons.nightlight_round, assetPath: 'assets/images/icons/sleep_sleep.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Sound Asleep', Icons.music_note, assetPath: 'assets/images/icons/sound.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(color: Color(0xFF3A4458)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Unlock all meditations.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'UPGRADE',
                      style: TextStyle(
                        color: Color(0xFF5CD4D4),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Back to Sleep', Icons.bedtime, assetPath: 'assets/images/icons/back.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Up at Night', Icons.light_mode, assetPath: 'assets/images/icons/up.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Bedtime Gratitude', Icons.favorite_border, assetPath: 'assets/images/icons/bedtime.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Deep Breathing', Icons.air, assetPath: 'assets/images/icons/deep.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Dream Scenes', Icons.cloud, assetPath: 'assets/images/icons/dream_sleep.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Drift to Sleep', Icons.sailing, assetPath: 'assets/images/icons/drift.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Nap', Icons.chair, assetPath: 'assets/images/icons/nap.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Reflection', Icons.water, assetPath: 'assets/images/icons/reflection.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Sleep for Kids', Icons.child_care, assetPath: 'assets/images/icons/kids.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Sleep Song', Icons.music_note, assetPath: 'assets/images/icons/song.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Sleep Stretch', Icons.self_improvement, assetPath: 'assets/images/icons/stretch.jpg')),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'COLOR NOISES',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'White Noise', Icons.graphic_eq, assetPath: 'assets/images/icons/white.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Brown Noise', Icons.graphic_eq, assetPath: 'assets/images/icons/brown.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Green Noise', Icons.graphic_eq, assetPath: 'assets/images/icons/green.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Pink Noise', Icons.graphic_eq, assetPath: 'assets/images/icons/pink.jpg')),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'SLEEP JOURNEYS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Above the Clouds', Icons.flight, assetPath: 'assets/images/icons/cl.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Along the River', Icons.directions_boat, assetPath: 'assets/images/icons/ri.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Off to Neverland', Icons.landscape, assetPath: 'assets/images/icons/ne.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'On the Road', Icons.directions_car, assetPath: 'assets/images/icons/road.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'On the Tracks', Icons.train, assetPath: 'assets/images/icons/track.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Up the Mountain', Icons.landscape, assetPath: 'assets/images/icons/mountain.jpg')),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'BEFORE SLEEP',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Nightly Review', Icons.star_border, assetPath: 'assets/images/icons/night.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Wind Down', Icons.event_seat, assetPath: 'assets/images/icons/wind.jpg')),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'SLEEP SOUNDS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Deep Sleep', Icons.album, assetPath: 'assets/images/icons/deepsleep.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Sleep Piano', Icons.piano, assetPath: 'assets/images/icons/piano.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Tranquil Sleep', Icons.album, assetPath: 'assets/images/icons/tran.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Campfire', Icons.local_fire_department, assetPath: 'assets/images/icons/fire.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Dryer', Icons.local_laundry_service, assetPath: 'assets/images/icons/dryer.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Fan', Icons.air, assetPath: 'assets/images/icons/fan.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Forest', Icons.forest, assetPath: 'assets/images/icons/forest.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Ocean', Icons.waves, assetPath: 'assets/images/icons/ocean.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Rain', Icons.umbrella, assetPath: 'assets/images/icons/rain.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Rainy City', Icons.location_city, assetPath: 'assets/images/icons/rainy.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Rainy Woods', Icons.park, assetPath: 'assets/images/icons/woods.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Riverboat', Icons.directions_boat, assetPath: 'assets/images/icons/boat.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Singing Bowls', Icons.circle_outlined, assetPath: 'assets/images/icons/bowl.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Stream', Icons.water, assetPath: 'assets/images/icons/stream.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Sunset Melody', Icons.music_note, assetPath: 'assets/images/icons/melody.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Thunderstorm', Icons.thunderstorm, assetPath: 'assets/images/icons/storm.jpg')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildCard(context, 'Train', Icons.train, assetPath: 'assets/images/icons/train.jpg')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildCard(context, 'Wind', Icons.air, assetPath: 'assets/images/icons/w.jpg')),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );

  Widget _buildCard(BuildContext context, String title, IconData icon, {String? assetPath}) => Container(
      height: 200,
      // No width specified, so width is adjustable via parent (Expanded in Row)
      decoration: const BoxDecoration(
        color: Color(0xFF3A4458),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Heading at the top
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Visual centered below the heading — use full remaining space and no rounded corners
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  if (title == 'Sleep') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SleepFlowRoot()),
                    );
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title tapped')));
                },
                child: assetPath != null
                    ? Image.asset(
                        assetPath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFF232B3A),
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.white24, size: 28),
                          ),
                        ),
                      )
                    : Center(child: Icon(icon, color: const Color(0xFF5CD4D4), size: 48)),
              ),
            ),
          ),
        ],
      ),
    );
}
