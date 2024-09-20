import 'package:eazrdaily/features/forget_password/reset_success_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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

    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevent overflow when the keyboard comes up
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
      body: SingleChildScrollView( // Enable scrolling when the keyboard appears
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/onlylogo.png'),
              const SizedBox(height: 20),
              Text(
                'Reset Your password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              // Password validation rows
              _buildValidationRow(
                  '6-20 characters', _passwordController.text.length >= 6 && _passwordController.text.length <= 20),
              const SizedBox(height: 5),
              _buildValidationRow('Includes numbers, lowercase letters',
                  RegExp(r'^[a-z0-9]+$').hasMatch(_passwordController.text)),
              const SizedBox(height: 5),
              _buildValidationRow('No spaces', !_passwordController.text.contains(' ')),
              const SizedBox(height: 5),
              _buildValidationRow('Duplicate login name', _passwordController.text == _confirmPasswordController.text),
              const SizedBox(height: 20),
              // Next button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isNextButtonEnabled
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetSuccessScreen(),
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
