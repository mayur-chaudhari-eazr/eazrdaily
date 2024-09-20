import 'package:flutter/material.dart';
import 'package:eazrdaily/features/login/fingerprint_login_screen.dart'; // Replace with your own import

class CreatePasscodeScreen extends StatefulWidget {
  const CreatePasscodeScreen({super.key});

  @override
  _CreatePasscodeScreenState createState() => _CreatePasscodeScreenState();
}

class _CreatePasscodeScreenState extends State<CreatePasscodeScreen> {
  String passcode = '';

  void _onKeyPressed(String value) {
    if (passcode.length < 6) {
      setState(() {
        passcode += value;
      });

      if (passcode.length == 6) {
        _navigateToNextScreen();
      }
    }
  }

  void _onBackspacePressed() {
    if (passcode.isNotEmpty) {
      setState(() {
        passcode = passcode.substring(0, passcode.length - 1);
      });
    }
  }

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  FingerprintLoginScreen()), // Replace with your next screen widget
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/lock.png'), // Replace with your own image
              const SizedBox(height: 20),
              Text(
                'Please create a passcode',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 100),
              _buildPasscodeDots(isDarkMode),
              const SizedBox(height: 40),
              _buildNumericKeypad(isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  // This method now shows the entered passcode as dots
  Widget _buildPasscodeDots(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return Column(
          children: [
            Text(
              index < passcode.length ? '●' : '', // Show dots instead of passcode
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 30,
              height: 2,
              color: isDarkMode ? Colors.white : Colors.black, // Keep the dashes constant
            ),
          ],
        );
      }),
    );
  }

  Widget _buildNumericKeypad(bool isDarkMode) {
    return Column(
      children: [
        _buildKeyRow(['1', '2', '3'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRow(['4', '5', '6'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRow(['7', '8', '9'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRow(['0', '<'], isDarkMode),
      ],
    );
  }

  Widget _buildKeyRow(List<String> keys, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return GestureDetector(
          onTap: () {
            if (key == '<') {
              _onBackspacePressed();
            } else {
              _onKeyPressed(key);
            }
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            child: key == '<'
                ? Icon(Icons.backspace, color: isDarkMode ? Colors.white : Colors.black)
                : Text(
              key,
              style: TextStyle(
                fontSize: 24,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
