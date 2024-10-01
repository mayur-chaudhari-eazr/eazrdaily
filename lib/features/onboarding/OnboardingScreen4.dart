import 'package:eazrdaily/features/login/enter_username_screen.dart';
import 'package:eazrdaily/features/registration/registration_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  _OnboardingScreen4State createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  bool _isEnglish = true; // Initial language is set to English

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Expanded to allow dynamic sizing of top section without overflow
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7FD6C2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/onboarding4.png', // Replace with your image path
                          width: screenWidth * 0.8, // Dynamically adjust width
                          height: screenHeight * 0.4, // Dynamically adjust height
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Custom Toggle (EN/FR)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isEnglish = !_isEnglish;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isDarkMode ? Colors.grey[700] : Colors.grey[300], // Background color: dark grey in dark mode, light grey in light mode
                            ),
                            child: Stack(
                              children: [
                                // Circle changes position and color when toggled
                                AnimatedAlign(
                                  alignment: _isEnglish ? Alignment.centerLeft : Alignment.centerRight,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: isDarkMode ? Colors.black : Colors.white, // Circle: white in light mode, black in dark mode
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isEnglish ? "EN" : "FR",
                                        style: TextStyle(
                                          color: isDarkMode ? Colors.white : Colors.black, // Text: black in light mode, white in dark mode
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Buttons section (Login and Register)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnterUsernameScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.white : Colors.black, // Button background color
                      foregroundColor: isDarkMode ? Colors.black : Colors.white, // Button text color
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Button padding
                      minimumSize: Size(double.infinity, screenHeight * 0.07), // Button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                    ),
                    child: const Text('Log in', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black, width: 2),
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      minimumSize: Size(double.infinity, screenHeight * 0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      foregroundColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                    child: const Text('Register', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),

            // Ensures the button touches the bottom without overflow
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02), // Bottom padding for spacing
            ),
          ],
        ),
      ),
    );
  }
}
