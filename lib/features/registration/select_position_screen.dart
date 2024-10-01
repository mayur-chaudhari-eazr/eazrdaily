import 'package:eazrdaily/features/registration/select_account_number_screen.dart';
import 'package:flutter/material.dart';

class SelectPositionScreen extends StatefulWidget {
  const SelectPositionScreen({super.key});

  @override
  _SelectPositionScreenState createState() => _SelectPositionScreenState();
}

class _SelectPositionScreenState extends State<SelectPositionScreen> {
  String selectedPosition = 'Leader';

  List<String> positionOptions = [
    'Staff',
    'Administrative staff',
    'Leader',
    'Manager',
    'General Director',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select position',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose your current position.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: isDarkMode ? Colors.white54 : Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedPosition,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: isDarkMode ? Colors.white : Colors.black),
                  dropdownColor: isDarkMode ? Colors.grey[800] : Colors.white, // Dropdown color in dark mode
                  items: positionOptions.map((String position) {
                    return DropdownMenuItem<String>(
                      value: position,
                      child: Text(
                        position,
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPosition = newValue!;
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectAccountNumberScreen()),
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
                child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
