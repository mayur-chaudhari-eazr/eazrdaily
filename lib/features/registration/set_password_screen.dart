import 'package:eazrdaily/features/registration/congratulations_screen.dart';
import 'package:flutter/material.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool isNextButtonEnabled = false;

  void _validatePassword() {
    setState(() {
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      if (password.length >= 6 &&
          password.length <= 20 &&
          RegExp(r'^[a-z0-9]+$').hasMatch(password) &&
          password == confirmPassword &&
          !password.contains(' ')) {
        isNextButtonEnabled = true;
      } else {
        isNextButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true, // Avoid overflow when keyboard is up
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.transparent : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Conditionally loading the logo based on dark or light mode
              Image.asset(
                isDarkMode
                    ? 'assets/images/logo_white.png' // Dark mode logo
                    : 'assets/images/onlylogo.png',  // Light mode logo
                width: 80, // Set appropriate width for the logo
              ),
              SizedBox(height: screenSize.height * 0.03),
              Text(
                'Please set password',
                style: TextStyle(
                  fontSize: screenSize.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              // Password input field
              TextField(
                controller: _passwordController,
                onChanged: (value) {
                  _validatePassword();
                },
                obscureText: true,
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: isDarkMode ? Colors.white54 : Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isDarkMode ? Colors.white54 : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              // Confirm Password input field
              TextField(
                controller: _confirmPasswordController,
                onChanged: (value) {
                  _validatePassword();
                },
                obscureText: true,
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: TextStyle(color: isDarkMode ? Colors.white54 : Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isDarkMode ? Colors.white54 : Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              // Password validation rows
              _buildValidationRow(
                  '6-20 characters', _passwordController.text.length >= 6 && _passwordController.text.length <= 20),
              SizedBox(height: screenSize.height * 0.01),
              _buildValidationRow('Includes numbers, lowercase letters',
                  RegExp(r'^[a-z0-9]+$').hasMatch(_passwordController.text)),
              SizedBox(height: screenSize.height * 0.01),
              _buildValidationRow('No spaces', !_passwordController.text.contains(' ')),
              SizedBox(height: screenSize.height * 0.01),
              _buildValidationRow('Duplicate login name', _passwordController.text == _confirmPasswordController.text),
              SizedBox(height: screenSize.height * 0.05), // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isNextButtonEnabled
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CongratulationsScreen(),
                      ),
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
                    padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for validation row with dot indicator
  Widget _buildValidationRow(String text, bool isValid) {
    final Color dotColor = isValid ? Colors.green : Colors.grey;
    final Color textColor = isValid ? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black) : Colors.grey;

    return Row(
      children: [
        Icon(
          Icons.circle,
          color: dotColor,
          size: 10,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
