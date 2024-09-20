import 'package:eazrdaily/features/login/enter_passcode_biometric.dart';
import 'package:flutter/material.dart';


class FingerprintErrorScreen extends StatelessWidget {
  const FingerprintErrorScreen({super.key});

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
            // Fingerprint Icon (Error)
            const Icon(
              Icons.fingerprint,
              size: 100,
              color: Colors.red, // Keep red for error indication
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
            // Error Message
            Text(
              'Fingerprint not recognized, try again.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            // "Try Again" Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle retry fingerprint authentication
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Try again with fingerprint'),
              ),
            ),
            const SizedBox(height: 20),
            // "Use the passcode" Button
            GestureDetector(
              onTap: () {
                // Handle passcode login
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterPasscodeScreen(),
                  ),
                );
              },
              child: Text(
                'Use the passcode',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey,
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
