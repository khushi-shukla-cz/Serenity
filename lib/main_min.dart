import 'package:flutter/material.dart';
import 'views/onboarding_view/screens/welcome_screen_animated.dart';
import 'views/splash_view/screens/loading_screen.dart';

void main() => runApp(const MinimalApp());

class MinimalApp extends StatelessWidget {
  const MinimalApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Minimal Balance App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
        home: const LoadingThenWelcome(),
      );
}

class LoadingThenWelcome extends StatefulWidget {
  const LoadingThenWelcome({super.key});

  @override
  State<LoadingThenWelcome> createState() => _LoadingThenWelcomeState();
}

class _LoadingThenWelcomeState extends State<LoadingThenWelcome> {
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _showLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) => _showLoading ? const LoadingScreen() : const WelcomeScreen(enableFloating: false);
}
