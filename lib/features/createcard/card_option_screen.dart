import 'package:flutter/material.dart';
import 'card_activation_screen.dart';

class CardOptionSelectionScreen extends StatefulWidget {
  @override
  _CardOptionSelectionScreenState createState() =>
      _CardOptionSelectionScreenState();
}

class _CardOptionSelectionScreenState extends State<CardOptionSelectionScreen> {
  int selectedCardIndex = 0; // Default selection for the first card

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick your card option',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  // Card image with border
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selectedCardIndex == 0
                              ? (isDarkMode ? Colors.white : Colors.black)
                              : (isDarkMode ? Colors.grey : Colors.grey[300]!),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/card_front_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Conditionally show Visa or MasterCard logo based on selection
                  Positioned(
                    bottom: 15,
                    right: 34,
                    child: Image.asset(
                      selectedCardIndex == 0
                          ? 'assets/images/visa.png' // Visa logo
                          : 'assets/images/Mastercard.png', // MasterCard logo
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Card options
            ListTile(
              leading: Image.asset('assets/images/visa.png', width: 30), // Replace with actual Visa icon path
              title: Text(
                'Debit Card',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                'Free',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              trailing: Radio(
                value: 0,
                groupValue: selectedCardIndex,
                onChanged: (value) {
                  setState(() {
                    selectedCardIndex = value!;
                  });
                },
                activeColor: isDarkMode ? Colors.white : Colors.black, // Manage color for dark mode
              ),
            ),
            const Divider(indent: 60,),
            ListTile(
              leading: Image.asset('assets/images/Mastercard.png', width: 30), // Replace with actual MasterCard icon path
              title: Text(
                'Master Card',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                'Free',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              trailing: Radio(
                value: 1,
                groupValue: selectedCardIndex,
                onChanged: (value) {
                  setState(() {
                    selectedCardIndex = value!;
                  });
                },
                activeColor: isDarkMode ? Colors.white : Colors.black, // Manage color for dark mode
              ),
            ),
            Spacer(),
            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String logoImage = selectedCardIndex == 0
                      ? 'assets/images/visa.png'
                      : 'assets/images/Mastercard.png';

                  // Navigate to CardActivationScreen and pass the card front image and selected logo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardActivationScreen(
                        cardImage: 'assets/images/card_front_image.png', // Pass the card front image
                        logoImage: logoImage, // Pass the selected logo image
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedCardIndex != -1
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : (isDarkMode ? Colors.grey : Colors.grey[300]),
                  foregroundColor: selectedCardIndex != -1
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : (isDarkMode ? Colors.black54 : Colors.white70),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
