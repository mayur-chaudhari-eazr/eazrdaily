import 'package:eazrdaily/features/forget_password/input_verification_code.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+1'; // Default country code

  // List of custom country codes
  List<String> countryCodes = ['+1', '+91', '+44', '+61', '+81'];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Password Recovery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your phone number to recover your password',
              style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.grey[400] : Colors.grey),
            ),
            const SizedBox(height: 40),
            // Country Code Dropdown and Phone Number Input
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: isDarkMode ? Colors.white70 : Colors.black54),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCountryCode,
                    dropdownColor: isDarkMode ? Colors.grey[800] : Colors.white,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    underline: const SizedBox(),
                    items: countryCodes.map((String code) {
                      return DropdownMenuItem<String>(
                        value: code,
                        child: Text(code),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountryCode = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                // Phone Number Input Field
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {}); // Rebuild UI when phone number is typed
                    },
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      hintText: '000-000-0000',
                      hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
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
                onPressed: _phoneController.text.length >= 10
                    ? () {
                  // Handle the next action (e.g., phone number verification)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputOtpVerificationScreen(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _phoneController.text.length >= 10
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : (isDarkMode ? Colors.grey[600] : Colors.grey[400]),
                  foregroundColor: _phoneController.text.length >= 10
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : (isDarkMode ? Colors.grey[800] : Colors.grey[600]),
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
}
