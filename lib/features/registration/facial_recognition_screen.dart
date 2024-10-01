import 'package:eazrdaily/features/registration/check_face_screen.dart';
import 'package:eazrdaily/features/registration/profile_verification_screen.dart';
import 'package:flutter/material.dart';

class FacialRecognitionScreen extends StatefulWidget {
  const FacialRecognitionScreen({super.key});

  @override
  _FacialRecognitionScreenState createState() => _FacialRecognitionScreenState();
}

class _FacialRecognitionScreenState extends State<FacialRecognitionScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                'Facial recognition',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'If any information is incorrect, please retake the ID photo.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.yellow[700],
                child: Image.asset(
                  'assets/images/girlimage1.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageDescription(
                    imagePath: 'assets/images/girlimage1.png',
                    text: 'Position your\nface within the circle',
                    isDarkMode: isDarkMode,
                  ),
                  _buildImageDescription(
                    imagePath: 'assets/images/girlimage2.png',
                    text: 'Ensure clear\nlighting, with no glare',
                    isDarkMode: isDarkMode,
                  ),
                  _buildImageDescription(
                    imagePath: 'assets/images/girlimage4.png',
                    text: 'Do not wear\nsunglasses or a hat',
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100), // Wider button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckFaceScreen()),
                  );
                },
                child: FittedBox(
                  child: Text(
                    'Start facial recognition',
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

  Widget _buildImageDescription({required String imagePath, required String text, required bool isDarkMode}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.yellow[700],
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 90,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
