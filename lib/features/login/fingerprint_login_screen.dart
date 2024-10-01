import 'package:flutter/material.dart';
import 'package:eazrdaily/features/login/fingerprint_login_2.dart';

class FingerprintLoginScreen extends StatelessWidget {
  const FingerprintLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            // Fingerprint icon and text centered in the screen
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fingerprint Icon
                Icon(
                  Icons.fingerprint,
                  size: 100,
                  color: isDarkMode ? Colors.white70 : Colors.grey[700],
                ),
                const SizedBox(height: 40),
                // Title
                Text(
                  'Login with fingerprint?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // Description
                Text(
                  'Would you like to enter the application with fingerprint.',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Spacer(),
            // Allow Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle fingerprint authentication
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FingerprintLoginScreen2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Allow', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 20),
            // Maybe Later Button
            GestureDetector(
              onTap: () {
                // Handle skipping fingerprint login
              },
              child: Text(
                'Maybe later',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
