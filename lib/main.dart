
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'views/home_view/screens/main_navigation.dart';
import 'views/onboarding_view/screens/welcome_screen_animated.dart';
import 'views/splash_view/screens/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MinimalApp());
}

class MinimalApp extends StatelessWidget {
  const MinimalApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Minimal Balance App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
        home: const AuthWrapper(),
      );
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Check if we have data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        
        // User is logged in
        if (snapshot.hasData && snapshot.data != null) {
          return const MainNavigation(initialIndex: 0);
        }
        
        // User is not logged in
        return const LoadingThenWelcome();
      },
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
      if (mounted) {
        setState(() => _showLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) => _showLoading ? const LoadingScreen() : const WelcomeScreen(enableFloating: false);
}


