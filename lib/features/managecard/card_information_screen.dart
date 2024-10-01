import 'package:flutter/material.dart';

class CardInformationScreen extends StatelessWidget {
  const CardInformationScreen({Key? key}) : super(key: key);

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
          'Card Information',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 24, // Increased font size for the title
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
            // Card information container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            const Spacer(),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showDatePicker(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20), // Increased font size for the button text
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Helper function to create a row with label and value
  Widget _buildInfoRow(String label, String value, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 18, // Increased font size for labels
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 18, // Increased font size for values
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Function to show a tilted date picker in a bottom sheet
  void _showDatePicker(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Select Date',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 22, // Increased font size for title
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.check, color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () {
                      // Confirm date selection
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (date) {
                    // Handle date change
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                ),
                child: const Text('Confirm', style: TextStyle(fontSize: 18)), // Increased font size for button
              ),
            ],
          ),
        );
      },
    );
  }
}
