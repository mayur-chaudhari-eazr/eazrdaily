import 'package:eazrdaily/features/payment/transfer_to_phone_screen.dart';
import 'package:flutter/material.dart';

class PhonePaymentDetailsScreen extends StatefulWidget {
  final String bankName;
  final String bankLogo;
  final String accountNumber;

  const PhonePaymentDetailsScreen({
    super.key,
    required this.bankName,
    required this.bankLogo,
    required this.accountNumber,
  });

  @override
  _PhonePaymentDetailsScreenState createState() => _PhonePaymentDetailsScreenState();
}

class _PhonePaymentDetailsScreenState extends State<PhonePaymentDetailsScreen> {
  final TextEditingController _amountController = TextEditingController();
  final String _selectedCardImage = 'assets/images/card1.png'; // Default card image
  bool _isNextButtonEnabled = false; // To control the enabled state of the button

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    setState(() {
      // Enable the Next button if there is any text entered in the amount field
      _isNextButtonEnabled = _amountController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);

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
      resizeToAvoidBottomInset: true, // Prevents overflow when keyboard comes up
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: mediaQuery.viewInsets.bottom + 16.0, // Adjusts padding for the keyboard
            top: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'You want to transfer to',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              // Bank Information
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
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Account Number
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.grey[400] : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.accountNumber,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    'Anne Laut',
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Amount of Money
              Text(
                'Amount of money',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.grey[400] : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'USD',
                  hintStyle: TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.black54),
                  filled: true,
                  fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: isDarkMode ? Colors.grey : Colors.black),
                  ),
                ),
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 16),
              // From Account Info
              Text(
                'From',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.grey[400] : Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.grey[300],
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 60,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(_selectedCardImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        'Thanh Nhan Pham',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                    Divider(
                      color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total balance',
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'USD 10,000',
                          style: TextStyle(
                            color: isDarkMode ? Colors.grey[400] : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Next Button
              ElevatedButton(
                onPressed: _isNextButtonEnabled
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferToPhoneScreen(
                        bankName: widget.bankName,
                        bankLogo: widget.bankLogo,
                        accountNumber: widget.accountNumber,
                        amount: _amountController.text, // Passing the amount
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode
                      ? (_isNextButtonEnabled ? Colors.white : Colors.grey)
                      : (_isNextButtonEnabled ? Colors.black : Colors.grey),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? (_isNextButtonEnabled ? Colors.black : Colors.white) : Colors.white,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
