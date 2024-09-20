import 'package:eazrdaily/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class ResetPinSuccessScreen extends StatelessWidget {
  const ResetPinSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.yellow[600],
              child: Icon(
                Icons.check,
                size: 30,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Reset Successfully',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 36, // Bigger heading text
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Please re-login to get Started',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 24, // Adjusted size
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/card_success.png', // Replace with your actual image path
              height: 300, // Larger image size
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.white : Colors.black,
                foregroundColor: isDarkMode ? Colors.black : Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Back to Home Screen',
                style: TextStyle(fontSize: 24), // Larger button text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
