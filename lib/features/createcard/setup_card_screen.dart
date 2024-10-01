import 'package:flutter/material.dart';
import 'package:eazrdaily/features/createcard/confirm_name_screen.dart';

class SetupCardScreen extends StatefulWidget {
  @override
  _SetupCardScreenState createState() => _SetupCardScreenState();
}

class _SetupCardScreenState extends State<SetupCardScreen> {
  int selectedIndex = 1; // Default selection set to index 1

  // Sample card designs (you can use network images or assets)
  final List<String> cardDesigns = [
    'assets/images/card1.png', // Replace with your actual image paths
    'assets/images/card2.png',
    'assets/images/card4.png',
    'assets/images/card5.png',
    'assets/images/card6.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Determine if dark mode is enabled
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context); // Implement back action
          },
        ),
        centerTitle: true,
        title: Text(
          'Setup Card',
          style: TextStyle(
            fontSize: 28,
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
              'Select a design option \nfor your card:',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            // Display selected design
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: selectedIndex != -1
                      ? DecorationImage(
                    image: AssetImage(cardDesigns[selectedIndex]),
                    fit: BoxFit.cover,
                  )
                      : null,
                  border: Border.all(
                    color: isDarkMode ? Colors.white : Colors.black,
                    width: 2,
                  ),
                  color: selectedIndex == -1
                      ? (isDarkMode ? Colors.black : Colors.grey[300])
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Card list view for selection
            Text(
              'Available Designs:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80, // Set height for the card list view
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardDesigns.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update the selected card
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10), // Spacing between cards
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.blueAccent
                              : (isDarkMode ? Colors.white : Colors.black),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage(cardDesigns[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            // Next Button
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmNameScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5, // Added slight elevation for a polished look
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
