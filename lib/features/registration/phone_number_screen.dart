import 'package:eazrdaily/features/registration/otp_input_screen.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isPhoneValid = false;

  // List of country codes
  String _selectedCountryCode = '+91'; // Default country code
  final List<Map<String, String>> _countryCodes = [
    {'code': '+91', 'country': 'India'},
    {'code': '+1', 'country': 'USA'},
    {'code': '+44', 'country': 'UK'},
    {'code': '+61', 'country': 'Australia'},
    {'code': '+81', 'country': 'Japan'},
    // Add more country codes here
  ];

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
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Begin now!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please provide your mobile number to verify your account.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Country code and phone number input
              Row(
                children: [
                  // Reduced width for Country Code Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    width: 90, // Adjust width to make it smaller
                    decoration: BoxDecoration(
                      border: Border.all(color: isDarkMode ? Colors.white54 : Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCountryCode,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        isDense: true,
                        isExpanded: false, // Prevent dropdown from taking up full width
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCountryCode = newValue!;
                          });
                        },
                        items: _countryCodes.map<DropdownMenuItem<String>>((Map<String, String> value) {
                          return DropdownMenuItem<String>(
                            value: value['code'],
                            child: Text(
                              value['code']!,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Phone Number Input
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        hintText: '000-000-0000',
                        hintStyle: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                        filled: true,
                        fillColor: isDarkMode ? Colors.black : Colors.white,
                      ),
                      cursorColor: isDarkMode ? Colors.white : Colors.black,
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      onChanged: (value) {
                        setState(() {
                          _isPhoneValid = value.length >= 10;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Privacy and Terms
              Text(
                'By clicking "Next," you accept the\nPrivacy policy and Terms of service',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              const Spacer(), // Spacer to push the Next button to the bottom

              // Next button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isPhoneValid
                        ? () {
                      // Navigate to OTP Verification Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isPhoneValid
                          ? (isDarkMode ? Colors.white : Colors.black)
                          : Colors.grey,
                      foregroundColor: _isPhoneValid
                          ? (isDarkMode ? Colors.black : Colors.white)
                          : Colors.black38,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ), // Disable button if phone is not valid
                    child: const Text('Next', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
            ],
              ),
          ),
        ),
      );
  }
}
