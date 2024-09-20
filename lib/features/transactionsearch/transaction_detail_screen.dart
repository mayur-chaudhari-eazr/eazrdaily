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
                CircleAvatar(
                  backgroundColor: isDarkMode ? Colors.white10 : Colors.orange[100],
                  radius: screenHeight * 0.05, // Responsive size
                  child: Image.asset(
                    'assets/images/hsbc.png', // HSBC image as an asset
                    fit: BoxFit.contain,
                    height: screenHeight * 0.05,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HSBC',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Housing',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        color: isDarkMode ? Colors.white54 : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
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

            // Bar Chart Section
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total spent for six months',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        DropdownButton<String>(
                          value: 'Monthly',
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          underline: Container(),
                          items: <String>['Monthly', 'Weekly']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$11,779.99',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBar('Jan', 50, false, isDarkMode, screenWidth),
                        _buildBar('Feb', 70, false, isDarkMode, screenWidth),
                        _buildBar('Mar', 100, true, isDarkMode, screenWidth), // Highlighted bar
                        _buildBar('Apr', 90, false, isDarkMode, screenWidth),
                        _buildBar('May', 60, false, isDarkMode, screenWidth),
                        _buildBar('Jun', 80, false, isDarkMode, screenWidth),
                      ],
                    ),
                  ],
                ),
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

  Widget _buildBar(String month, double height, bool isHighlighted, bool isDarkMode, double screenWidth) {
    return Column(
      children: [
        Text(
          month,
          style: TextStyle(fontSize: screenWidth * 0.03, color: isDarkMode ? Colors.white70 : Colors.grey),
        ),
        const SizedBox(height: 4),
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: isHighlighted
                ? (isDarkMode ? Colors.black : Colors.black)
                : (isDarkMode ? Colors.grey[600] : Colors.grey[400]),
            borderRadius: BorderRadius.circular(4),
          ),
          child: isHighlighted
              ? Center(
            child: Text(
              '\$10,125',
              style: TextStyle(fontSize: screenWidth * 0.02, color: isDarkMode ? Colors.white : Colors.white),
            ),
          )
              : Container(),
        ),
      ],
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
