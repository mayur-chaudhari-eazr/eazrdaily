import 'package:eazrdaily/features/login/fingerprint_error_screen.dart';
import 'package:flutter/material.dart';

class FingerprintLoginScreen2 extends StatelessWidget {
  const FingerprintLoginScreen2({super.key});

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
            // Fingerprint Icon
            Icon(
              Icons.fingerprint,
              size: 100,
              color: isDarkMode ? Colors.white70 : Colors.grey[700],
            ),
            const SizedBox(height: 20),
            // Title
            Text(
              'Login with fingerprint',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Description
            Text(
              'Touch the fingerprint sensor.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // Use the passcode Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Handle passcode login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FingerprintErrorScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(
                      color: isDarkMode ? Colors.white70 : Colors.black, // Adjust border color for dark mode
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Use the passcode',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
