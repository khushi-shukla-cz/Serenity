import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/icons/balance.png'),
          width: 120, // adjust according to your design
          height: 120,
          fit: BoxFit.contain,
        ),
      ),
    );
}
