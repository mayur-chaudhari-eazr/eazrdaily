import 'package:eazrdaily/features/registration/select_position_screen.dart';
import 'package:flutter/material.dart';

class SelectCompanyScreen extends StatefulWidget {
  const SelectCompanyScreen({super.key});

  @override
  _SelectCompanyScreenState createState() => _SelectCompanyScreenState();
}

class _SelectCompanyScreenState extends State<SelectCompanyScreen> {
  String selectedJob = 'Social media'; // Default selected item

  List<String> jobOptions = [
    'HRM',
    'Social media',
    'Developer',
    'Teacher',
    'Engineer',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
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
              'Select Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose your current job.',
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
                  value: selectedJob,
                  isExpanded: true,
                  dropdownColor: isDarkMode ? Colors.grey[800] : Colors.white, // Dark mode dropdown color
                  items: jobOptions.map((String job) {
                    return DropdownMenuItem<String>(
                      value: job,
                      child: Text(
                        job,
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedJob = newValue!;
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
                    MaterialPageRoute(builder: (context) =>  SelectPositionScreen()),
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
