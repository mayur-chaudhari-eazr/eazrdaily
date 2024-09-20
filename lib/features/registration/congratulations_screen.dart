import 'package:eazrdaily/features/login/enter_username_screen.dart';
import 'package:flutter/material.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Enable automatic adjustment of content when keyboard appears
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.transparent : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap content in a scroll view to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.yellow[600],
                child: Icon(Icons.check, size: 50, color: isDarkMode ? Colors.black : Colors.white,),
              ),
              const SizedBox(height: 20),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Account Information Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildInfoRow('Account number', '1386 8888 66', isDarkMode),
                    const Divider(),
                    _buildInfoRow('Account Owner', 'Thanh Nhan', isDarkMode),
                    const Divider(),
                    _buildInfoRow('Transaction limit', 'USD 100.000/month', isDarkMode),
                    const Divider(),
                    _buildInfoRow('Activation date', '01/01/2024', isDarkMode),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Delivery and Tracking Information
              _buildInfoRowWithIcon(
                Icons.local_shipping,
                'You will receive your card within',
                '3 days',
                isDarkMode,
              ),
              const Divider(),
              _buildInfoRowWithIcon(
                Icons.phone_iphone,
                'Track delivery progress and activate',
                'card right on the app',
                isDarkMode,
              ),
              const SizedBox(height: 150), // Adjust the height before button
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EnterUsernameScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,
                    foregroundColor: isDarkMode ? Colors.black : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Info Row (Account number, Transaction limit, etc.)
  Widget _buildInfoRow(String title, String value, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey, fontSize: 16),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  // Widget for Info Row with Icon (Delivery and Tracking)
  Widget _buildInfoRowWithIcon(IconData icon, String text, String highlightText, bool isDarkMode) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          child: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: ' $highlightText',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
