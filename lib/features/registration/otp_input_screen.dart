import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// Import your CaptureIDScreen
import 'capture_id_screen.dart'; // Update with the correct path to your CaptureIDScreen

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool isOtpComplete = false;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120; // 2-minute countdown

  void navigateToNextScreen() {
    // Navigate to the next screen without OTP validation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CaptureIDScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Input verification code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please input the code from the SMS.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              // OTP input field
              OtpTextField(
                numberOfFields: 6,
                borderColor: isDarkMode ? Colors.white54 : Colors.grey,
                focusedBorderColor: isDarkMode ? Colors.white : Colors.black,
                cursorColor: isDarkMode ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(10),
                onCodeChanged: (value) {
                  // React to partial input if necessary
                },
                onSubmit: (code) {
                  // Mark OTP as complete when the code is fully entered
                  setState(() {
                    isOtpComplete = code.length == 6;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend code for reload',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return const Text(
                          '00:00',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        );
                      }
                      return Text(
                        '${time.min ?? '00'}:${time.sec ?? '00'}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Don’t receive an OTP?',
                    style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Logic to resend OTP
                    },
                    child: Text(
                      'Resend now',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isOtpComplete ? navigateToNextScreen : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isOtpComplete
                          ? (isDarkMode ? Colors.white : Colors.black)
                          : Colors.grey, // Button is grey if OTP is incomplete
                      foregroundColor: isOtpComplete
                          ? (isDarkMode ? Colors.black : Colors.white)
                          : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ), // Button is only enabled if OTP is complete
                    child: const Text('Next'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
