import 'package:eazrdaily/features/registration/phone_number_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo at the top-left corner with conditional image
              Image.asset(
                isDarkMode
                    ? 'assets/images/logo_white.png' // Dark mode logo
                    : 'assets/images/onlylogo.png',  // Light mode logo
                width: 80, // Set appropriate width for the logo
              ),
              const SizedBox(height: 10),
              // Title
              Text(
                'Complete your registration\nIn just 3 steps',
                style: TextStyle(
                  fontSize: 26, // Larger text
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Steps
              buildStepItem('1', 'Verify your phone number', isDarkMode),
              const SizedBox(height: 15),
              buildStepItem('2', 'Authenticate your identity', isDarkMode),
              const SizedBox(height: 15),
              buildStepItem('3', 'Confirm your information', isDarkMode),
              const SizedBox(height: 40),
              // Terms and conditions section
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20), // Increased padding
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                      12), // Larger radius for rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.security,
                            color: isDarkMode ? Colors.white70 : Colors.black54),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'We are committed to protecting your personal information.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Increased font size
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                          activeColor: isDarkMode ? Colors.white : Colors.black,
                          checkColor: isDarkMode ? Colors.black : Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            'By checking this box, I confirm that I have read and agree to the Personal Data Processing Regulations and the Terms and Conditions for account services.',
                            style: TextStyle(
                              fontSize: 14, // Larger font size
                              color: isDarkMode ? Colors.white70 : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhoneNumberScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    foregroundColor: isDarkMode ? Colors.black : Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16), // Consistent padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16), // Adjusted for consistency
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18, // Consistent font size for button
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the step item
  Widget buildStepItem(
      String stepNumber, String stepDescription, bool isDarkMode) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18, // Increased radius for the step number circle
          backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
          child: Text(
            stepNumber,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16, // Increased font size for step number
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            stepDescription,
            style: TextStyle(
              fontSize: 18, // Increased font size for the step description
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
