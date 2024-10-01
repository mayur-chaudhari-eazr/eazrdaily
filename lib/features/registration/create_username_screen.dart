import 'package:eazrdaily/features/registration/set_password_screen.dart';
import 'package:flutter/material.dart';

class CreateUsernameScreen extends StatefulWidget {
  const CreateUsernameScreen({super.key});

  @override
  _CreateUsernameScreenState createState() => _CreateUsernameScreenState();
}

class _CreateUsernameScreenState extends State<CreateUsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  bool isNextButtonEnabled = false;

  void _validateUsername(String value) {
    setState(() {
      if (value.length >= 6 && value.length <= 16 && _isAlphanumeric(value)) {
        isNextButtonEnabled = true;
      } else {
        isNextButtonEnabled = false;
      }
    });
  }

  bool _isAlphanumeric(String value) {
    final regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(value);
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
            Image.asset('assets/images/onlylogo.png'),
            const SizedBox(height: 20),
            Text(
              'Please create a username',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Username input field
            TextField(
              controller: _usernameController,
              onChanged: (value) {
                _validateUsername(value);
              },
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter username',
                hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: _usernameController.text.length >= 6 &&
                      _usernameController.text.length <= 16
                      ? Colors.green
                      : isDarkMode ? Colors.white70 : Colors.grey,
                  size: 10,
                ),
                const SizedBox(width: 10),
                Text(
                  '6-16 characters',
                  style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: _isAlphanumeric(_usernameController.text)
                      ? Colors.green
                      : isDarkMode ? Colors.white70 : Colors.grey,
                  size: 10,
                ),
                const SizedBox(width: 10),
                Text(
                  'Do not include special characters',
                  style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isNextButtonEnabled
                    ? () {
                  // Handle next button action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetPasswordScreen()),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isNextButtonEnabled
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : Colors.grey,
                  foregroundColor: isNextButtonEnabled
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : Colors.white,
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
