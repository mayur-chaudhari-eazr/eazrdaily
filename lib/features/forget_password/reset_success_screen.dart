import 'package:eazrdaily/features/login/enter_username_screen.dart';
import 'package:flutter/material.dart';

class ResetSuccessScreen extends StatelessWidget {
  const ResetSuccessScreen({super.key});

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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Yellow circle with check mark icon
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.yellow[600],
                          child: const Icon(Icons.check, size: 50, color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        // Reset Successfully Text
                        Text(
                          'Reset Successfully',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Instruction Text
                        Text(
                          'Please re-login to get started',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkMode ? Colors.white70 : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Card with checkmark illustration (replace with your own image path)
                        Image.asset(
                          'assets/images/card_success.png', // Replace with your actual image asset
                          width: MediaQuery.of(context).size.width * 1, // Responsive sizing
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        const Spacer(),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to login or next screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EnterUsernameScreen()),
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
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
