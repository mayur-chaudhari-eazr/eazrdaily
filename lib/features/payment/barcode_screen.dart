import 'package:flutter/material.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Entire screen black
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Back button at the top
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                ),
              ),
            ),
            const SizedBox(height: 50), // Spacing between the back button and the content
            const Text(
              'Scan the QR code',
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 28, // Larger font size
                fontWeight: FontWeight.bold, // Bold for emphasis
              ),
              textAlign: TextAlign.center, // Center align the text
            ),
            const SizedBox(height: 40), // Spacing between the text and the QR code
            Center(
              child: Stack(
                alignment: Alignment.center, // Align children in the center
                children: [
                  Container(
                    width: 250, // Width of the box
                    height: 250, // Height of the box
                    decoration: BoxDecoration(
                      color: Colors.white, // White box
                      borderRadius: BorderRadius.circular(16), // Rounded corners for the box
                    ),
                    child: Center(
                      child: Icon(
                        Icons.qr_code, // QR code icon as a placeholder
                        size: 200, // Size of the QR code icon
                        color: Colors.black, // Black color for the QR code icon
                      ),
                    ),
                  ),
                  // White fitted box behind the logo
                  Container(
                    width: 60, // Adjust the size as needed
                    height: 60, // Adjust the size as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // White background for the logo
                      borderRadius: BorderRadius.circular(16), // Rounded corners for the box
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/onlylogo.png',
                        fit: BoxFit.contain, // Scale the image to fit within the box
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
