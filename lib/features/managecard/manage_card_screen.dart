import 'package:eazrdaily/features/managecard/card_information_screen.dart';
import 'package:eazrdaily/features/managecard/get_card_statement_screen.dart';
import 'package:eazrdaily/features/managecard/reset_pin_screen.dart';
import 'package:eazrdaily/features/managecard/set_card_limit.dart';
import 'package:flutter/material.dart';
import 'lock_card_screen.dart'; // Import the LockCardBottomSheet file

class ManageCardScreen extends StatefulWidget {
  const ManageCardScreen({Key? key}) : super(key: key);

  @override
  _ManageCardScreenState createState() => _ManageCardScreenState();
}

class _ManageCardScreenState extends State<ManageCardScreen> {
  bool isCardLocked = false; // State to track whether the card is locked

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
        title: Text(
          'Manage Card',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 28, // Increased font size for the title
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to overlay the rotated background and the card image
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Rotated background container behind the card
                  Transform.rotate(
                    angle: -0.05, // Rotating the container slightly
                    child: Container(
                      width: 320,
                      height: 210,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF2D2D36) : Colors.grey[300], // Adjust color for dark/light mode
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode
                                ? Colors.black.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.3), // Shadow based on mode
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 10), // Shadow position
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Card image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/card_image_3.png', // Replace with actual image path
                      width: 320,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Show the grey lock icon only if the card is locked
                  if (isCardLocked)
                    Positioned(
                      child: Icon(
                        Icons.lock,
                        size: 100, // Adjust size as needed
                        color: Colors.black.withOpacity(0.7), // Semi-transparent lock icon
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacing between the card and the label box
            // Monthly Payment Cap Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.pink, size: 30), // Icon beside the text
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly Payment Cap',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18, // Font size for heading
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Progress bar
                      Stack(
                        children: [
                          Container(
                            height: 6, // Height of the background progress bar
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.grey, // Grey background bar
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 6, // Progress indicator height
                            width: MediaQuery.of(context).size.width * 0.25, // 50% progress
                            decoration: BoxDecoration(
                              color: Colors.pink, // Progress color
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6), // Spacing below the progress bar
                      Text(
                        'Remaining \$8,000 of \$16,000',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Increased spacing
            Text(
              'Settings',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 22, // Increased font size for section heading
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), // Increased spacing
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock, color: isDarkMode ? Colors.white : Colors.black, size: 30),
                    title: Text(
                      'Lock card',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 20), // Increased font size
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
                    onTap: () async {
                      // Show the bottom sheet to lock/unlock the card
                      bool result = await _showLockCardBottomSheet(context);
                      setState(() {
                        isCardLocked = result;
                      });
                    },
                  ),
                  Divider(color: isDarkMode ? Colors.grey : Colors.black38),
                  ListTile(
                    leading: Icon(Icons.remove_red_eye, color: isDarkMode ? Colors.white : Colors.black, size: 30),
                    title: Text(
                      'View card information',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 20), // Increased font size
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
                    onTap: () {
                      // Handle view card info action
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CardInformationScreen()));
                    },
                  ),
                  Divider(color: isDarkMode ? Colors.grey : Colors.black38),
                  ListTile(
                    leading: Icon(Icons.credit_card, color: isDarkMode ? Colors.white : Colors.black, size: 30),
                    title: Text(
                      'Set card limit',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 20), // Increased font size
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
                    onTap: () {
                      // Handle set card limit action
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SetCardLimitScreen()));
                    },
                  ),
                  Divider(color: isDarkMode ? Colors.grey : Colors.black38),
                  ListTile(
                    leading: Icon(Icons.receipt_long, color: isDarkMode ? Colors.white : Colors.black, size: 30),
                    title: Text(
                      'Get a card statement',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 20), // Increased font size
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
                    onTap: () {
                      // Handle get statement action
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetCardStatementScreen()));
                    },
                  ),
                  Divider(color: isDarkMode ? Colors.grey : Colors.black38),
                  ListTile(
                    leading: Icon(Icons.lock_reset, color: isDarkMode ? Colors.white : Colors.black, size: 30),
                    title: Text(
                      'Reset PIN',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 20), // Increased font size
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
                    onTap: () {
                      // Handle reset PIN action
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPinScreen()));
                    },
                  ),
                  Divider(color: isDarkMode ? Colors.grey : Colors.black38),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show lock card bottom sheet and get result
  Future<bool> _showLockCardBottomSheet(BuildContext context) async {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    bool result = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return LockCardBottomSheet(isDarkMode: isDarkMode, isLocked: isCardLocked);
      },
    );

    return result;
  }
}
