import 'package:eazrdaily/features/login/finger_print_success_screen.dart';
import 'package:eazrdaily/features/login/fingerprint_login_screen.dart';
import 'package:flutter/material.dart';

class EnterPasscodeScreen extends StatefulWidget {
  const EnterPasscodeScreen({super.key});

  @override
  _EnterPasscodeScreenState createState() => _EnterPasscodeScreenState();
}

class _EnterPasscodeScreenState extends State<EnterPasscodeScreen> {
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
      MaterialPageRoute(builder: (context) => const FingerprintSuccessScreen()), // Your next screen
    );
  }

  void _onBiometricPressed() {
    // Navigate to fingerprint login screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  FingerprintLoginScreen()),
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
              Image.asset('assets/images/lock.png'),
              const SizedBox(height: 20),
              Text(
                'Enter a passcode',
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

  // Passcode dots
  Widget _buildPasscodeDots(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return Column(
          children: [
            Text(
              index < passcode.length ? '●' : '', // Show dots for passcode
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
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        );
      }),
    );
  }

  // Numeric keypad
  Widget _buildNumericKeypad(bool isDarkMode) {
    return Column(
      children: [
        _buildKeyRow(['1', '2', '3'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRow(['4', '5', '6'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRow(['7', '8', '9'], isDarkMode),
        const SizedBox(height: 20),
        _buildKeyRowWithBiometric(isDarkMode),
      ],
    );
  }

  // Numeric row with biometric button, 0 and backspace
  Widget _buildKeyRowWithBiometric(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Biometric Button
        GestureDetector(
          onTap: _onBiometricPressed,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            child: Icon(
              Icons.fingerprint,
              size: 40,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        // "0" Button
        GestureDetector(
          onTap: () {
            _onKeyPressed('0');
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 24,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        // Backspace Button
        GestureDetector(
          onTap: _onBackspacePressed,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
            child: Icon(
              Icons.backspace,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  // Numeric row without biometric button
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
