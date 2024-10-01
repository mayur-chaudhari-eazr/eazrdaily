import 'package:flutter/material.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bank logo and title
            Row(
              children: [
                const SizedBox(width: 50),
                Text(
                  'HSBC',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 20,),
                CircleAvatar(
                  backgroundColor: isDarkMode ? Colors.white10 : Colors.orange[100],
                  radius: screenHeight * 0.05, // Responsive size
                  child: Image.asset(
                    'assets/images/hsbc.png', // HSBC image as an asset
                    fit: BoxFit.contain,
                    height: screenHeight * 0.05,
                  ),
                ),
                const SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Housing',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Transaction Date
            Center(
              child: Text(
                '12 Feb 2024',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: isDarkMode ? Colors.white54 : Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Transaction Amount
            Center(
              child: Text(
                '-1,256.00',
                style: TextStyle(
                  fontSize: screenWidth * 0.12, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.redAccent : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Replace Bar Chart Section with Image
            Center(
              child: Image.asset(
                'assets/images/Transaction.png', // Replace with the image asset
                width: screenWidth * 0.9, // Adjust size according to screen width
                fit: BoxFit.contain, // Make sure the image scales properly
              ),
            ),
            const SizedBox(height: 24),

            // List of Options
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.repeat, 'Recur payment', isDarkMode, screenWidth),
                  _buildListTile(Icons.description, 'Send invoice', isDarkMode, screenWidth),
                  _buildListTile(Icons.report_problem, 'Report a problem', isDarkMode, screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, bool isDarkMode, double screenWidth) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.045, // Responsive font size
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white54 : Colors.grey),
      onTap: () {
        // Handle option click
      },
    );
  }
}
