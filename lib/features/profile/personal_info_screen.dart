import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal info',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/person1.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: isDarkMode ? Colors.white : Colors.black,
                            size: 28,
                          ),
                          onPressed: () {
                            // Handle image update
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Full Name Field
                _buildTextField(
                  'Enter your full name:',
                  'Full Name',
                  'Thanh Nha',
                  _fullNameFocusNode,
                  isDarkMode,
                ),
                const SizedBox(height: 16),

                // Email Field
                _buildTextField(
                  'Enter your email:',
                  'Email',
                  'hellothanh@gamil.com',
                  _emailFocusNode,
                  isDarkMode,
                ),
                const SizedBox(height: 16),

                // Password Field
                _buildTextField(
                  'Enter your password:',
                  'Password',
                  '',
                  _passwordFocusNode,
                  isDarkMode,
                  obscureText: true,
                ),
                const SizedBox(height: 16),

                // Repeat Password Field
                _buildTextField(
                  'Repeat your password:',
                  'Repeat Password',
                  '',
                  _repeatPasswordFocusNode,
                  isDarkMode,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, String hintText, FocusNode focusNode, bool isDarkMode, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          focusNode: focusNode,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: placeholder,
            labelStyle: TextStyle(
              fontSize: 18,
              color: isDarkMode ? Colors.grey : Colors.black,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Grey border
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Grey border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Grey border when focused
            ),
            filled: true,
            fillColor: focusNode.hasFocus
                ? Colors.transparent // Set to transparent when focused
                : (isDarkMode ? Colors.black : Colors.white), // Regular fill color
          ),
          style: TextStyle(
            fontSize: 18,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onTap: () {
            setState(() {});
          },
          onEditingComplete: () {
            setState(() {});
          },
        ),
      ],
    );
  }
}
