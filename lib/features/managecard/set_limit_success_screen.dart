import 'package:flutter/material.dart';

class SetLimitSuccessScreen extends StatelessWidget {
  final String limitAmount;

  const SetLimitSuccessScreen({
    Key? key,
    required this.limitAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.yellow[600],
                child: Icon(
                  Icons.check,
                  size: 30,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Congratulation!',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36 * textScaleFactor,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 20),
              Text(
                'Your current POS payment \nlimit is',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 24 * textScaleFactor,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 10),
              Text(
                'USD $limitAmount', // Displaying dynamic limit amount
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 36 * textScaleFactor,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/card_success.png',
                height: 300,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Back to Home Screen',
                  style: TextStyle(fontSize: 24 * textScaleFactor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
