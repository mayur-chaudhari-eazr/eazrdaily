import 'package:eazrdaily/features/createcard/card_activation_screen.dart';
import 'package:eazrdaily/features/createcard/card_option_screen.dart';
import 'package:flutter/material.dart';

class ConfirmNameScreen extends StatelessWidget {
  final String firstName = "Thanh Nhan"; // Pre-filled first name
  final String lastName = "Pham"; // Pre-filled last name

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
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please confirm \nyour name.',
              style: TextStyle(
                fontSize: 40,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 50),
            // First name field
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'First name',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                Text(
                  firstName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: isDarkMode ? Colors.white70 : Colors.black54,
              thickness: 1,
            ),
            SizedBox(height: 20),
            // Last name field
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last name',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                Text(
                  lastName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: isDarkMode ? Colors.white70 : Colors.black54,
              thickness: 1,
            ),
            Spacer(),
            // Legal name instructions
            Text(
              'Please use your legal first and last name. This will be helpful for hotel and car bookings abroad.',
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white38 : Colors.black38,
              ),
            ),
            SizedBox(height: 20),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle the next button press
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardOptionSelectionScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
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
