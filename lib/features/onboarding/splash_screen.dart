import 'dart:async';
import 'package:flutter/material.dart';
import 'package:eazrdaily/features/onboarding/OnboardingScreen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Future.delayed(const Duration(seconds: 3), _navigateToOnboarding);
  }

  void _navigateToOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1630DB),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/credentlogo.png'),
          height: 350,
          width: 350,
        ),
      ),
    );
  }
}
