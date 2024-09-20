import 'package:flutter/material.dart';

class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Entire screen black
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,// Same color as the background
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ), // Center the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center the column horizontally
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0), // Spacing below the text
              child: Text(
                'Scan the QR code',
                style: TextStyle(
                  color: Colors.white, // White text
                  fontSize: 28, // Larger font size
                  fontWeight: FontWeight.bold, // Bold for emphasis
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
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
                  color: Colors.grey[400], // Light grey color for the QR code icon
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
