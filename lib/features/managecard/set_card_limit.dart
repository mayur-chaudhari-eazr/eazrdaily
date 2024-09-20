import 'package:flutter/material.dart';
import 'set_amount_limit_screen.dart'; // Import the next screen

class SetCardLimitScreen extends StatelessWidget {
  const SetCardLimitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Set Card Limit',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 24, // Increased font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap in SingleChildScrollView to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetLimitAmountScreen(
                        limitType: 'POS Payment Limit',
                        currentLimit: '10,000',
                      ),
                    ),
                  );
                },
                child: LimitCard(
                  title: 'POS Payment Limit',
                  description: 'Maximum amount of payment via card swipe machine (POS) in 1 day',
                  amount: 'USD 10,000',
                  isDarkMode: isDarkMode,
                  imagePath: 'assets/images/Coin.png', // Custom image path
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetLimitAmountScreen(
                        limitType: 'Online Payment Limit',
                        currentLimit: '5,000',
                      ),
                    ),
                  );
                },
                child: LimitCard(
                  title: 'Online Payment Limit',
                  description: 'Maximum amount of money for online payment by card in 1 day',
                  amount: 'USD 5,000',
                  isDarkMode: isDarkMode,
                  imagePath: 'assets/images/Coin.png', // Custom image path
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetLimitAmountScreen(
                        limitType: 'ATM Transfer Limit',
                        currentLimit: '25,000',
                      ),
                    ),
                  );
                },
                child: LimitCard(
                  title: 'ATM Transfer Limit',
                  description: 'Maximum amount of money transferred via ATM in 1 day',
                  amount: 'USD 25,000',
                  isDarkMode: isDarkMode,
                  imagePath: 'assets/images/Coin.png', // Custom image path
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LimitCard extends StatelessWidget {
  final String title;
  final String description;
  final String amount;
  final bool isDarkMode;
  final String imagePath;

  const LimitCard({
    Key? key,
    required this.title,
    required this.description,
    required this.amount,
    required this.isDarkMode,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0), // Increased padding for more space
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22, // Increased font size
            ),
          ),
          const SizedBox(height: 12), // Increased spacing
          Text(
            description,
            style: TextStyle(
              color: isDarkMode ? Colors.white70 : Colors.black54,
              fontSize: 16, // Slightly larger font for better readability
            ),
          ),
          const SizedBox(height: 12), // Increased spacing
          Divider(
            color: isDarkMode ? Colors.white24 : Colors.black26,
            thickness: 1.5, // Slightly thicker divider for a more defined look
          ),
          const SizedBox(height: 12), // Increased spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath,
                height: 40, // Larger image size
                width: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16), // Adjusted space between image and text
              Expanded(
                child: Text(
                  amount,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // Increased size for the amount text
                  ),
                  textAlign: TextAlign.right, // Align text to the right for cleaner look
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
