import 'package:eazrdaily/features/login/create_passcode_screen.dart';
import 'package:flutter/material.dart';

import '../forget_password/enter_forget_password_screen.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({super.key});

  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar for both light and dark modes
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
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
              'And Your Password',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Password input field
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible, // Toggle visibility
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Align "Forget Password" to the right with increased tap area
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PasswordRecoveryScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password',
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
                onPressed: () {
                  // Handle next button action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePasscodeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Login In'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
