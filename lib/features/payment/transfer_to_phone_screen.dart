import 'package:flutter/material.dart';
import 'package:eazrdaily/features/payment/transfer_success_page.dart';

class TransferToPhoneScreen extends StatefulWidget {
  final String bankName;
  final String bankLogo;
  final String accountNumber;
  final String amount; // Accept amount as a parameter

  const TransferToPhoneScreen({
    super.key,
    required this.bankName,
    required this.bankLogo,
    required this.accountNumber,
    required this.amount, // Required amount parameter
  });

  @override
  _TransferToPhoneScreenState createState() => _TransferToPhoneScreenState();
}

class _TransferToPhoneScreenState extends State<TransferToPhoneScreen> {
  late TextEditingController _amountController;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: widget.amount); // Initialize with passed amount
  }

  @override
  void dispose() {
    _amountController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showConfirmationSheet() {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(  // Wrap with SingleChildScrollView
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white, // Dark mode background color
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Let the sheet content take minimum space
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: isDarkMode ? Colors.white : Colors.black, // Close icon color based on mode
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Confirm transfer',
                style: TextStyle(
                  fontSize: 28, // Increased font size for the title
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Text color for dark mode
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'USD ${_amountController.text}',
                style: TextStyle(
                  fontSize: 32, // Increased font size for amount
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white70 : Colors.black87, // Text color for amount
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'From',
                style: TextStyle(
                  fontSize: 20, // Increased font size for labels
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey, // Label text color
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset('assets/images/onlylogo.png'),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thanh Nhan Pham',
                        style: TextStyle(
                          fontSize: 22, // Larger text for name
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black, // Text color
                        ),
                      ),
                      Text(
                        '1386 8888 66',
                        style: TextStyle(
                          fontSize: 18, // Larger text for account number
                          color: isDarkMode ? Colors.grey[400] : Colors.grey, // Subtext color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'To',
                style: TextStyle(
                  fontSize: 20, // Increased font size for labels
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey, // Label text color
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(widget.bankLogo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anne Laut',
                        style: TextStyle(
                          fontSize: 22, // Larger text for name
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black, // Text color
                        ),
                      ),
                      Text(
                        widget.accountNumber,
                        style: TextStyle(
                          fontSize: 18, // Larger text for account number
                          color: isDarkMode ? Colors.grey[400] : Colors.grey, // Subtext color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(
                color: isDarkMode ? Colors.grey[700] : Colors.grey[300], // Divider color for dark mode
              ),
              const SizedBox(height: 20),
              Text(
                'Transaction Fee',
                style: TextStyle(
                  fontSize: 20, // Increased font size for labels
                  color: isDarkMode ? Colors.grey[400] : Colors.grey, // Label text color
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'USD 0.00',
                style: TextStyle(
                  fontSize: 22, // Larger text for transaction fee
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Amount text color
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Message',
                style: TextStyle(
                  fontSize: 20, // Increased font size for labels
                  color: isDarkMode ? Colors.grey[400] : Colors.grey, // Label text color
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _messageController.text.isNotEmpty
                    ? _messageController.text
                    : 'No message provided',
                style: TextStyle(
                  fontSize: 22, // Larger text for the message
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Message text color
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccessfulPage(
                        bankLogo: widget.bankLogo,
                        amount: _amountController.text,
                        receiverAccount: widget.accountNumber,
                        receiverName: 'Anne Laut',
                        bankName: widget.bankName,
                        message: _messageController.text.isNotEmpty
                            ? _messageController.text
                            : 'No message provided',
                        deliveryDate: '12 May 2024, 9:31 AM',
                        tradingCode: 'OS91739101032887117',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black, // Button color in dark mode
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Fingerprint authentication',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.black : Colors.white, // Button text color for dark mode
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccessfulPage(
                        bankLogo: widget.bankLogo,
                        amount: _amountController.text,
                        receiverAccount: widget.accountNumber,
                        receiverName: 'Anne Laut',
                        bankName: widget.bankName,
                        message: _messageController.text.isNotEmpty
                            ? _messageController.text
                            : 'No message provided',
                        deliveryDate: '12 May 2024, 9:31 AM',
                        tradingCode: 'OS91739101032887117',
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  'Passcode Authentication',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white70 : Colors.grey, // TextButton color for dark mode
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You want to transfer to',
              style: TextStyle(fontSize: 24, color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(widget.bankLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bankName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Phone number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isDarkMode ? Colors.grey[400] : Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              widget.accountNumber,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 16),
            Text(
              'Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isDarkMode ? Colors.grey[400] : Colors.black87),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Amount (USD)',
                filled: true,
                fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 16),
            Text(
              'Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: isDarkMode ? Colors.grey[400] : Colors.black87),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter message (Optional)',
                filled: true,
                fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _showConfirmationSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode
                    ? Colors.white // White background in dark mode
                    : Colors.black, // Black background in light mode
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
                      ? Colors.black // Black text in dark mode
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
