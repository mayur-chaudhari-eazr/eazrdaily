import 'package:eazrdaily/features/registration/id_confirmation_screen.dart';
import 'package:flutter/material.dart';

class BackPanVerificationScreen extends StatefulWidget {
  const BackPanVerificationScreen({super.key});

  @override
  _BackPanVerificationScreenState createState() =>
      _BackPanVerificationScreenState();
}

class _BackPanVerificationScreenState extends State<BackPanVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Take a photo of the back of your ID',
                  style: TextStyle(
                    fontSize: 18, // Adjusted font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Place the back of your ID in the frame.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 200),
          // Simulate the ID scanning frame area
          Center(
            child: Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.credit_card,
                  color: Colors.white60,
                  size: 100,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Navigate to the IDConfirmationScreen when the icon is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IDConfirmationScreen(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(15), // Adjust padding for circular effect
              ),
            ),
          ),
        ],
      ),
    );
  }
}
