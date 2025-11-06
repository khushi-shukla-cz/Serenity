// Backup of original main.dart before temporarily replacing with a minimal entrypoint.

import 'package:flutter/material.dart';

import 'views/onboarding_view/screens/welcome_screen_animated.dart';
import 'views/splash_view/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Balance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const SplashToWelcome(),
    );
}

class SplashToWelcome extends StatefulWidget {
  const SplashToWelcome({super.key});

  @override
  State<SplashToWelcome> createState() => _SplashToWelcomeState();
}

class _SplashToWelcomeState extends State<SplashToWelcome> {
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) => _showLoading ? const LoadingScreen() : const WelcomeScreen(enableFloating: false);
}
