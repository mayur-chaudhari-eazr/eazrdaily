import 'package:eazrdaily/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';

class FingerprintSuccessScreen extends StatefulWidget {
  const FingerprintSuccessScreen({super.key});

  @override
  _FingerprintSuccessScreenState createState() => _FingerprintSuccessScreenState();
}

class _FingerprintSuccessScreenState extends State<FingerprintSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Green Fingerprint Icon
            const Icon(
              Icons.fingerprint,
              size: 100,
              color: Colors.green, // Green to indicate successful fingerprint
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              'Accurate fingerprint',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Sub-title
            Text(
              'Please wait for login',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Success Check Icon
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.yellow[600],
              child: Icon(
                Icons.check,
                size: 30,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            // Loading Spinner at the bottom
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
