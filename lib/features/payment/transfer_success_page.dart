import 'package:flutter/material.dart';

class TransferSuccessfulPage extends StatelessWidget {
  final String amount;
  final String receiverAccount;
  final String receiverName;
  final String bankName;
  final String bankLogo;  // Add bank logo field
  final String message;
  final String deliveryDate;
  final String tradingCode;

  const TransferSuccessfulPage({
    super.key,
    required this.amount,
    required this.receiverAccount,
    required this.receiverName,
    required this.bankName,
    required this.bankLogo,  // Receive bank logo as a parameter
    required this.message,
    required this.deliveryDate,
    required this.tradingCode,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,  // Adjust icon color based on theme
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,  // Adjust icon theme
        ),
        automaticallyImplyLeading: true,  // Make sure the leading back button works properly
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: mediaQuery.viewInsets.bottom + 16.0,  // Dynamic padding to account for keyboard
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align everything to the left
            children: [
              const SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.yellow,
                  child: Icon(
                    Icons.check,
                    color: isDarkMode ? Colors.white : Colors.black,  // Adjust icon color based on theme
                    size: 50,
                  ),
                ),
              const SizedBox(height: 30),
              Text(
                  'Transfer Successful',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,  // Adjust text color based on theme
                  ),
                ),
              const SizedBox(height: 10),
            Text(
                  'USD $amount',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white70 : Colors.black87,  // Adjust text color based on theme
                  ),
                ),
              const SizedBox(height: 30),
              buildDetailSection('Receiver', receiverAccount, receiverName, isDarkMode),
              const SizedBox(height: 20),
              buildBankDetailSection('Receiving bank', bankName, bankLogo, isDarkMode),  // Dynamic bank logo
              const SizedBox(height: 20),
              buildDetailSection('Message', message, '', isDarkMode),
              const SizedBox(height: 20),
              buildDetailSection('Delivery date', deliveryDate, '', isDarkMode),
              const SizedBox(height: 20),
              buildDetailSection('Trading code', tradingCode, '', isDarkMode),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle complete action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black,  // Adjust button color
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Complete',
                    style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode ? Colors.black : Colors.white,  // Adjust button text color
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // New method to display bank details with a dynamic logo
  Widget buildBankDetailSection(String label, String bankName, String bankLogo, bool isDarkMode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(bankLogo),  // Load bank logo dynamically
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey,  // Adjust label color based on theme
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              bankName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isDarkMode ? Colors.white70 : Colors.black87,  // Adjust value color based on theme
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDetailSection(String label, String value, String subValue, bool isDarkMode, {IconData? icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,  // Align items to the top and left
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(icon, color: Colors.orange),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Ensure the text stays left-aligned
          children: [
            Text(
              label,
              style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey,  // Adjust label color based on theme
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: isDarkMode ? Colors.white70 : Colors.black87,  // Adjust value color based on theme
              ),
            ),
            if (subValue.isNotEmpty)
              Text(
                subValue,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: isDarkMode ? Colors.white54 : Colors.black54,  // Adjust subValue color based on theme
                ),
              ),
          ],
        ),
      ],
    );
  }
}
