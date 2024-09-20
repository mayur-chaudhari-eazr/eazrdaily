import 'package:eazrdaily/features/registration/front_pan_verification_screen.dart';
import 'package:flutter/material.dart';

class CaptureIDScreen extends StatelessWidget {
  const CaptureIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures the body extends behind the transparent AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'We need to capture both sides of your ID',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please take a photo of your most recent ID for verification.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              _buildInstruction(
                image: const AssetImage('assets/images/id_1.png'),
                text: 'Keep your ID straight in the frame.',
                isDarkMode: isDarkMode,
              ),
              _buildInstruction(
                image: const AssetImage('assets/images/id_2.png'),
                text: 'Avoid photos that are glarey, blurry, or unclear.',
                isDarkMode: isDarkMode,
              ),
              _buildInstruction(
                image: const AssetImage('assets/images/id_3.png'),
                text: 'Use official documents.',
                isDarkMode: isDarkMode,
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  FrontPanVerificationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Begin shooting',
                    style: TextStyle(color: isDarkMode ? Colors.black : Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstruction({
    required ImageProvider image,
    required String text,
    required bool isDarkMode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image(
            image: image,
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
