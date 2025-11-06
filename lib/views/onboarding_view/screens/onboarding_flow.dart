import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../home_view/screens/main_navigation.dart';
// math utilities moved into extracted widgets
import '../widgets/goal_card.dart';
import '../widgets/option_card.dart';
import 'loading_screens.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  int currentPage = 0;
  Set<String> selectedGoals = {};
  String? selectedStressFrequency;
  String? selectedStressExperience;
  String? selectedStressSource;
  String? selectedAge;
  late TextEditingController _ageController;
  String? selectedStudent;
  String? selectedMeditationExp;
  String? selectedMeditationTime;
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
  // For notification permission
  bool notificationAllowed = false;

  void nextPage() {
    setState(() {
      if (currentPage < 12) {
        currentPage++;
      } else {
        // Navigate to loading screens after completing onboarding
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoadingScreens()),
        );
      }
    });
  }

  double get progress => (currentPage + 1) / 13;

  @override
  void initState() {
    super.initState();
    _ageController = TextEditingController(text: selectedAge);
    _ageController.addListener(() {
      final text = _ageController.text.trim();
      if (text.isEmpty) {
        if (selectedAge != null) setState(() => selectedAge = null);
      } else if (selectedAge != text) {
        setState(() => selectedAge = text);
      }
    });
  }

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

  int? get _enteredAge => (selectedAge == null || selectedAge!.isEmpty) ? null : int.tryParse(selectedAge!.trim());

  bool get _isAgeValid => _enteredAge != null && _enteredAge! >= 13;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color(0xFFE0E0E0),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4ECDC4)),
                  minHeight: 6,
                ),
              ),
            ),
            Expanded(child: _buildPage()),
          ],
        ),
      ),
      // Show a bottom, non-filled CTA on pages that previously had an inline CTA.
      bottomNavigationBar: (currentPage == 0 || currentPage == 1 || currentPage == 2 || currentPage == 6 || currentPage == 7)
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 6),
                child: Builder(builder: (context) {
                  // Determine onPressed per-page while preserving original enablement/behavior
                  VoidCallback? onPressed;
                  if (currentPage == 6) {
                    // Age page preserves enabled state
                    onPressed = _isAgeValid ? nextPage : null;
                  } else {
                    // For page 7 (stat) and other pages, continue to next page
                    onPressed = nextPage;
                  }

                  return TextButton(
                    onPressed: onPressed,
                    child: const Text(
                      'TAP TO CONTINUE',
                      style: TextStyle(
                        color: Color(0xFF4ECDC4),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  );
                }),
              ),
            )
          : null,
    );

  Widget _buildPage() {
    switch (currentPage) {
      case 0:
        return _buildIntroPage();
      case 1:
        return _buildGoalsPage();
      case 2:
        return _buildTestimonialPage();
      case 3:
        return _buildStressFrequencyPage();
      case 4:
        return _buildStressExperiencePage();
      case 5:
        return _buildStressSourcePage();
      case 6:
        return _buildAgePage();
      case 7:
        return _buildStatPage();
      case 8:
        return _buildStudentPage();
      case 9:
        return _buildMeditationExperiencePage();
      case 10:
        return _buildMeditationTimePage();
      case 11:
        return _buildReminderTimeScreen();
      case 12:
        return _buildNotificationPermissionScreen();
      default:
        return _buildIntroPage();
    }
  }

  Widget _buildIntroPage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Answer a few questions\nto personalize your\nexperience.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildGoalsPage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Select the goals that\nmatter to you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GoalCard(
                                  title: 'Reduce Stress',
                                  iconData: Icons.spa,
                                  bgColor: const Color(0xFFE8E4F3),
                                  isSelected: selectedGoals.contains('Reduce Stress'),
                                  onTap: () {
                                    setState(() {
                                      if (selectedGoals.contains('Reduce Stress')) {
                                        selectedGoals.remove('Reduce Stress');
                                      } else {
                                        selectedGoals.add('Reduce Stress');
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: GoalCard(
                                  title: 'Improve Sleep',
                                  iconData: Icons.hotel,
                                  bgColor: const Color(0xFFD4F1F4),
                                  isSelected: selectedGoals.contains('Improve Sleep'),
                                  onTap: () {
                                    setState(() {
                                      if (selectedGoals.contains('Improve Sleep')) {
                                        selectedGoals.remove('Improve Sleep');
                                      } else {
                                        selectedGoals.add('Improve Sleep');
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: GoalCard(
                                  title: 'Increase Focus',
                                  iconData: Icons.center_focus_strong,
                                  bgColor: const Color(0xFFFFF4E6),
                                  isSelected: selectedGoals.contains('Increase Focus'),
                                  onTap: () {
                                    setState(() {
                                      if (selectedGoals.contains('Increase Focus')) {
                                        selectedGoals.remove('Increase Focus');
                                      } else {
                                        selectedGoals.add('Increase Focus');
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: GoalCard(
                                  title: 'Improve Mood',
                                  iconData: Icons.emoji_emotions,
                                  bgColor: const Color(0xFFFFE4E1),
                                  isSelected: selectedGoals.contains('Improve Mood'),
                                  onTap: () {
                                    setState(() {
                                      if (selectedGoals.contains('Improve Mood')) {
                                        selectedGoals.remove('Improve Mood');
                                      } else {
                                        selectedGoals.add('Improve Mood');
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  // GoalCard widget extracted to lib/views/onboarding_view/widgets/goal_card.dart

  Widget _buildTestimonialPage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Here\'s what our\nmembers are saying:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.spa, color: Color(0xFF4ECDC4)),
                          ),
                        ),
                        const SizedBox(width: 24),
                        const Expanded(
                          child: Text(
                            '95% report less stress',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Based on a study of members who use\nBalance 5 times per week.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildStressFrequencyPage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'How often do you\nfeel stressed?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OptionCard(
                            title: 'Almost always',
                            iconData: Icons.sentiment_very_dissatisfied,
                            bgColor: const Color(0xFFFFE4E1),
                            isSelected: selectedStressFrequency == 'Almost always',
                            onTap: () {
                              setState(() {
                                selectedStressFrequency = 'Almost always';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Sometimes',
                            iconData: Icons.sentiment_neutral,
                            bgColor: const Color(0xFFFFF4E6),
                            isSelected: selectedStressFrequency == 'Sometimes',
                            onTap: () {
                              setState(() {
                                selectedStressFrequency = 'Sometimes';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Rarely',
                            iconData: Icons.sentiment_satisfied,
                            bgColor: const Color(0xFFE8E4F3),
                            isSelected: selectedStressFrequency == 'Rarely',
                            onTap: () {
                              setState(() {
                                selectedStressFrequency = 'Rarely';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Not sure',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildStressExperiencePage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'How do you usually\nexperience stress?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OptionCard(
                            title: 'Anxious thoughts',
                            iconData: Icons.psychology,
                            bgColor: const Color(0xFFD4F1F4),
                            isSelected: selectedStressExperience == 'Anxious thoughts',
                            onTap: () {
                              setState(() {
                                selectedStressExperience = 'Anxious thoughts';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Physical discomfort',
                            iconData: Icons.health_and_safety,
                            bgColor: const Color(0xFFFFE4E1),
                            isSelected: selectedStressExperience == 'Physical discomfort',
                            onTap: () {
                              setState(() {
                                selectedStressExperience = 'Physical discomfort';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Moodiness',
                            iconData: Icons.mood_bad,
                            bgColor: const Color(0xFFE8E4F3),
                            isSelected: selectedStressExperience == 'Moodiness',
                            onTap: () {
                              setState(() {
                                selectedStressExperience = 'Moodiness';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Difficulty sleeping',
                            iconData: Icons.bedtime,
                            bgColor: const Color(0xFFFFF4E6),
                            isSelected: selectedStressExperience == 'Difficulty sleeping',
                            onTap: () {
                              setState(() {
                                selectedStressExperience = 'Difficulty sleeping';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Not sure',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildStressSourcePage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'What\'s the biggest\nsource of your stress?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.25,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OptionCard(
                            title: 'Money',
                            iconData: Icons.attach_money,
                            bgColor: const Color(0xFFE8E4F3),
                            isSelected: selectedStressSource == 'Money',
                            onTap: () {
                              setState(() {
                                selectedStressSource = 'Money';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Work or school',
                            iconData: Icons.work,
                            bgColor: const Color(0xFFFFF4E6),
                            isSelected: selectedStressSource == 'Work or school',
                            onTap: () {
                              setState(() {
                                selectedStressSource = 'Work or school';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Health',
                            iconData: Icons.health_and_safety,
                            bgColor: const Color(0xFFD4F1F4),
                            isSelected: selectedStressSource == 'Health',
                            onTap: () {
                              setState(() {
                                selectedStressSource = 'Health';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          OptionCard(
                            title: 'Relationships',
                            iconData: Icons.favorite,
                            bgColor: const Color(0xFFFFE4E1),
                            isSelected: selectedStressSource == 'Relationships',
                            onTap: () {
                              setState(() {
                                selectedStressSource = 'Relationships';
                                nextPage();
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Not sure',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildAgePage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'How old are you?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'Your guidance will be tailored\nto your age group.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[500],
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Numeric input field for age
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: SizedBox(
                        width: 220,
                        child: TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(3)],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: 2),
                          decoration: InputDecoration(
                            hintText: 'e.g. 29',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF4ECDC4)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox.shrink(),

                    // Show validation message when age is provided but under 13
                    if (_enteredAge != null && !_isAgeValid) ...[
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Age must be 13 or older to use Balance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  Widget _buildStatPage() => LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'DID YOU KNOW?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 30,
                            height: 1.3,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w300,
                          ),
                          children: const [
                            TextSpan(text: 'Balance has helped\n'),
                            TextSpan(text: '542,273', style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: ' people your age\nimprove mental wellness.'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        'As of January 2024',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
    );

  // OptionCard widget extracted to lib/views/onboarding_view/widgets/option_card.dart

  Widget _buildStudentPage() => Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Are you a student?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34, color: Colors.grey[800], fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'This will inform whether you receive\nguidance related to school.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.grey[500], height: 1.4),
          ),
        ),
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStudent = 'Yes';
                    nextPage();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4F1F4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Yes',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedStudent = 'No';
                    nextPage();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E4F3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'No',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );

  Widget _buildMeditationExperiencePage() => Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'What best describes your\nmeditation experience?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, height: 1.25, color: Colors.grey[800], fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'Meditation can help reduce stress.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
        ),
        const SizedBox(height: 60),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                OptionCard(
                  title: 'New to meditation',
                  iconData: Icons.spa,
                  bgColor: const Color(0xFFFFE4E1),
                  isSelected: selectedMeditationExp == 'New to meditation',
                  onTap: () {
                    setState(() {
                      selectedMeditationExp = 'New to meditation';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 16),
                OptionCard(
                  title: 'Tried it once or twice',
                  iconData: Icons.self_improvement,
                  bgColor: const Color(0xFFD4F1F4),
                  isSelected: selectedMeditationExp == 'Tried it once or twice',
                  onTap: () {
                    setState(() {
                      selectedMeditationExp = 'Tried it once or twice';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 16),
                OptionCard(
                  title: 'Meditate occasionally',
                  iconData: Icons.park,
                  bgColor: const Color(0xFFFFF4E6),
                  isSelected: selectedMeditationExp == 'Meditate occasionally',
                  onTap: () {
                    setState(() {
                      selectedMeditationExp = 'Meditate occasionally';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 16),
                OptionCard(
                  title: 'Meditate often',
                  iconData: Icons.nature,
                  bgColor: const Color(0xFFD4F1F4),
                  isSelected: selectedMeditationExp == 'Meditate often',
                  onTap: () {
                    setState(() {
                      selectedMeditationExp = 'Meditate often';
                      nextPage();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );

  Widget _buildMeditationTimePage() => Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'When would you\nlike to meditate?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, height: 1.25, color: Colors.grey[800], fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(height: 60),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                OptionCard(
                  title: 'Morning',
                  iconData: Icons.wb_sunny,
                  bgColor: const Color(0xFFD4F1F4),
                  isSelected: selectedMeditationTime == 'Morning',
                  onTap: () {
                    setState(() {
                      selectedMeditationTime = 'Morning';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 16),
                OptionCard(
                  title: 'Afternoon',
                  iconData: Icons.wb_sunny,
                  bgColor: const Color(0xFFFFE4E1),
                  isSelected: selectedMeditationTime == 'Afternoon',
                  onTap: () {
                    setState(() {
                      selectedMeditationTime = 'Afternoon';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 16),
                OptionCard(
                  title: 'Evening',
                  iconData: Icons.nights_stay,
                  bgColor: const Color(0xFFD4F1F4),
                  isSelected: selectedMeditationTime == 'Evening',
                  onTap: () {
                    setState(() {
                      selectedMeditationTime = 'Evening';
                      nextPage();
                    });
                  },
                ),
                const SizedBox(height: 40),
                Text('Not sure', style: TextStyle(fontSize: 17, color: Colors.grey[400])),
              ],
            ),
          ),
        ),
      ],
    );

  Widget _buildReminderTimeScreen() => Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text(
                'When would you\nlike to be reminded?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    builder: (BuildContext context, Widget? child) => Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xFF4ECDC4),
                            onPrimary: Colors.white,
                            surface: Colors.white,
                            onSurface: Colors.black87,
                          ),
                          timePickerTheme: const TimePickerThemeData(
                            backgroundColor: Colors.white,
                            hourMinuteTextColor: Colors.black87,
                            hourMinuteColor: Color(0xFFF5F5F5),
                            dayPeriodTextColor: Colors.black87,
                            dayPeriodColor: Color(0xFFF5F5F5),
                            dialHandColor: Color(0xFF4ECDC4),
                            dialBackgroundColor: Color(0xFFF5F5F5),
                            dialTextColor: Colors.black87,
                            entryModeIconColor: Colors.black87,
                            hourMinuteTextStyle: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        child: child!,
                      ),
                  );
                  if (picked != null && picked != selectedTime) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _formatTime(selectedTime),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black54,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4ECDC4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(flex: 2),
      ],
    );

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'am' : 'pm';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildNotificationPermissionScreen() => Column(
      children: [
        const Spacer(),
        
        // Main content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // Title
              const Text(
                'Get a daily reminder to\nmeet your goals',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Subtitle
              Text(
                'Reminders help you build better habits.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Notification card
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Bell icon
                    const Icon(
                      Icons.notifications,
                      color: Color(0xFF4ECDC4),
                      size: 48,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Permission text
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(text: 'Allow '),
                          TextSpan(
                            text: 'Balance',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' to send you\nnotifications?'),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Allow button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            notificationAllowed = true;
                          });
                          nextPage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4ECDC4),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Allow',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Don't allow button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            notificationAllowed = false;
                          });
                          nextPage();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF4ECDC4).withOpacity(0.3),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Don't allow",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
        
        const Spacer(flex: 2),
      ],
    );

}
