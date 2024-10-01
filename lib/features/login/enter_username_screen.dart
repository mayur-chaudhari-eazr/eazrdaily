import 'package:eazrdaily/features/login/enter_password_screen.dart';
import 'package:flutter/material.dart';

class EnterUsernameScreen extends StatefulWidget {
  const EnterUsernameScreen({super.key});

  @override
  _EnterUsernameScreenState createState() => _EnterUsernameScreenState();
}

class _EnterUsernameScreenState extends State<EnterUsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isButtonEnabled = false; // Tracks whether the button is enabled

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateInput); // Listen for text changes
  }

  void _validateInput() {
    setState(() {
      // Enable the button only if the username field is not empty
      _isButtonEnabled = _usernameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
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
              'Please enter a username',
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
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter username',
                hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black54),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Align "Forget Username" to the right
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _showForgotUsernameDialog(context, isDarkMode);
                },
                child: Text(
                  'Forget Username',
                  style: TextStyle(
                    fontSize: 15,
                    color: isDarkMode ? Colors.white70 : Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  // Handle next button action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnterPasswordScreen(),
                    ),
                  );
                }
                    : null, // Disable the button when input is empty
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : Colors.grey, // Grey when disabled
                  foregroundColor: _isButtonEnabled
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : Colors.white70, // Adjust text color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Function to display the Forgot Username dialog
  void _showForgotUsernameDialog(BuildContext context, bool isDarkMode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.85, // Make the dialog wider
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close icon at the top-right corner
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Forgot Username',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Please contact hotline\n1900-8888-88 for support.',
                  style: TextStyle(
                    fontSize: 20,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Wider "Ok" button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.white : Colors.black,
                      foregroundColor: isDarkMode ? Colors.black : Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Ok'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
