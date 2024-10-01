import 'package:eazrdaily/features/registration/account_confirmation_screen.dart';
import 'package:flutter/material.dart';

class CreateAccountNumberScreen extends StatefulWidget {
  const CreateAccountNumberScreen({super.key});

  @override
  _CreateAccountNumberScreenState createState() =>
      _CreateAccountNumberScreenState();
}

class _CreateAccountNumberScreenState extends State<CreateAccountNumberScreen> {
  final TextEditingController _accountNumberController = TextEditingController();
  bool isNextButtonEnabled = false;

  void _onNumberEntered(String value) {
    setState(() {
      if (value.length >= 6 && value.length <= 14) {
        isNextButtonEnabled = true;
      } else {
        isNextButtonEnabled = false;
      }
    });
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your account number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Text Field for account number input
            TextField(
              controller: _accountNumberController,
              onChanged: (value) {
                _onNumberEntered(value);
              },
              keyboardType: TextInputType.number,
              maxLength: 14,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Enter last 6 - 14 digits',
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Year of birth suggestion
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Year of birth\nExample: 1990, 1994, 1998, 2000,...',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isNextButtonEnabled
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountConfirmationScreen(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isNextButtonEnabled ? (isDarkMode ? Colors.white : Colors.black) : Colors.grey,
                  foregroundColor: isNextButtonEnabled ? (isDarkMode ? Colors.black : Colors.white) : Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ), // Disable button if not enough digits entered
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
