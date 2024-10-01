import 'package:flutter/material.dart';
import 'package:eazrdaily/features/managecard/confirm_new_pin_code_settings.dart'; // Replace with your own import

class PinCodeSettings extends StatefulWidget {
  const PinCodeSettings({super.key});

  @override
  _PinCodeSettingsState createState() => _PinCodeSettingsState();
}

class _PinCodeSettingsState extends State<PinCodeSettings> {
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
      MaterialPageRoute(builder: (context) => const ConfirmPinCodeSettings()),
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
                'PIN Code Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'Please enter new pin code',
                style: TextStyle(
                  fontSize: 20,
                  color: isDarkMode ? Colors.grey : Colors.grey[700],
                ),
              ),
              const SizedBox(height: 50),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKey('0', isDarkMode), // '0' below '8'
            _buildKey('<', isDarkMode), // Backspace below '9'
          ],
        ),
      ],
    );
  }

  Widget _buildKeyRow(List<String> keys, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return _buildKey(key, isDarkMode);
      }).toList(),
    );
  }

  Widget _buildKey(String key, bool isDarkMode) {
    return GestureDetector(
      onTap: () {
        if (key == '<') {
          _onBackspacePressed();
        } else if (key.isNotEmpty) {
          _onKeyPressed(key);
        }
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: isDarkMode ? Colors.white : Colors.grey[200], // White in dark mode
        child: key == '<'
            ? Icon(Icons.backspace, color: isDarkMode ? Colors.black : Colors.black) // Black backspace icon
            : Text(
                key,
                style: TextStyle(
                  fontSize: 24,
                  color: isDarkMode ? Colors.black : Colors.black, // Black text for both modes
                ),
              ),
      ),
    );
  }
}
