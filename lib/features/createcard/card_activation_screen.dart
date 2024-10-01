import 'package:eazrdaily/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:eazrdaily/features/createcard/textsize_widget.dart'; // Import the TextSizes class

class CardActivationScreen extends StatefulWidget {
  final String cardImage; // The image of the card front
  final String logoImage; // The selected logo image (Visa or MasterCard)

  CardActivationScreen({required this.cardImage, required this.logoImage});

  @override
  _CardActivationScreenState createState() => _CardActivationScreenState();
}

class _CardActivationScreenState extends State<CardActivationScreen> {
  bool isFront = true; // To track if it's showing the front or back of the card

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
        centerTitle: true,
        title: Text(
          'Setup Card',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: TextSizes.large(context), // Use large text size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Debit card is now \nactive and ready!',
              style: TextStyle(
                fontSize: TextSizes.extraLarge(context), // Use extra large text size
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Tap to flip the card.',
              style: TextStyle(
                fontSize: TextSizes.medium(context), // Use medium text size
                color: isDarkMode ? Colors.white70 : Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFront = !isFront; // Flip the card
                });
              },
              child: Container(
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Card image (front or back) with border
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDarkMode ? Colors.white : Colors.black,
                            width: 2, // Adjust the border width as needed
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                isFront ? widget.cardImage : 'assets/images/card_back.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Logo on the front of the card
                    if (isFront)
                      Positioned(
                        bottom: 15,
                        right: 34,
                        child: Image.asset(
                          widget.logoImage, // Display the selected logo (Visa or MasterCard)
                          width: 50,
                          height: 50,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Finish button press
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Finish',
                  style: TextStyle(
                    fontSize: TextSizes.medium(context), // Use medium text size for button
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
