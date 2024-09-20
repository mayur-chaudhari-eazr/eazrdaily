import 'package:eazrdaily/features/payment/payment_detail_screen.dart';
import 'package:flutter/material.dart';

class AccountNumberScreen extends StatefulWidget {
  final String bankName;
  final String bankLogo;

  const AccountNumberScreen({super.key, required this.bankName, required this.bankLogo});

  @override
  _AccountNumberScreenState createState() => _AccountNumberScreenState();
}

class _AccountNumberScreenState extends State<AccountNumberScreen> {
  final TextEditingController _accountNumberController = TextEditingController();
  bool _isNextEnabled = false;

  void _onAccountNumberChanged(String value) {
    setState(() {
      _isNextEnabled = value.length == 12; // Enable button for exactly 12 digits
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You want to transfer to',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black, fontSize: 24), // Adjusted for dark mode
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.bankLogo),
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.bankName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Account number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isDarkMode ? Colors.grey[400] : Colors.black87),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _accountNumberController,
              keyboardType: TextInputType.number,
              maxLength: 12,
              decoration: InputDecoration(
                hintText: 'Please enter account number',
                hintStyle: TextStyle(fontSize: 16, color: isDarkMode ? Colors.grey[400] : Colors.black54), // Consistent styling
                filled: true,
                fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: isDarkMode ? Colors.grey : Colors.black),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black), // Consistent text color
              onChanged: _onAccountNumberChanged,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _isNextEnabled
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentDetailsScreen(
                      bankName: widget.bankName,
                      bankLogo: widget.bankLogo,
                      accountNumber: _accountNumberController.text,
                    ),
                  ),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode
                    ? (_isNextEnabled ? Colors.white : Colors.grey) // White background in dark mode
                    : (_isNextEnabled ? Colors.black : Colors.grey), // Black background in light mode
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode
                      ? (_isNextEnabled ? Colors.black : Colors.white) // Black text in dark mode
                      : Colors.white, // White text in light mode
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
