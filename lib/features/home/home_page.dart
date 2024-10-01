import 'package:eazrdaily/features/createcard/setup_debit_card_screen.dart';
import 'package:eazrdaily/features/managecard/manage_card_screen.dart';
import 'package:eazrdaily/features/notification/notification_page.dart';
import 'package:eazrdaily/features/transactionsearch/transaction_search_screen.dart';
import 'package:flutter/material.dart';
import '../payment/payment_screen.dart';

bool _isBalanceVisible = false;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Helper for Send Money Avatar with Image.asset and onTap event
  Widget _buildSendMoneyAvatar(String name,
      {String? imageAsset, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback if defined
      child: Column(
        children: [
          CircleAvatar(
            radius: 36, // Avatar size
            backgroundColor:
                Colors.transparent, // No background color for the image
            child: imageAsset != null
                ? ClipOval(
                    child: Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  )
                : Container(), // Show empty container if no image
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 14)), // Reduced font size
        ],
      ),
    );
  }

  // Helper for Transaction List Tile with Image.asset
  Widget _buildTransactionTile(String title, String subtitle, double amount,
      {String? imageAsset}) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 30, // Avatar size
        backgroundColor:
            Colors.transparent, // No background color for the image
        child: ClipOval(
          child: Image.asset(
            imageAsset ?? 'assets/images/default_avatar.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20, // Reduced font size
        ),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 14)), // Reduced font size
      trailing: Text(
        '${amount.toStringAsFixed(2)}', // Format the amount
        style: TextStyle(
          color: (amount < 0)
              ? (isDarkMode ? Colors.white : Colors.black)
              : Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 18, // Reduced font size
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        automaticallyImplyLeading: false, // Removes the default back arrow
        titleSpacing: 0, // Remove spacing for better alignment
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Mastercard.png', // Mastercard logo image
                    width: 36, // Adjust the logo size
                    height: 36,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: 30, // Standard size for the arrow icon
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetupDebitCardScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Account and Card',
                  style: TextStyle(
                    fontSize: 24, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 30,)
              ],
            ),
            IconButton(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: isDarkMode ? Colors.white : Colors.black,
                    size: 30, // Notification icon size
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 18, // Red dot size
                      width: 18,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.red, // Red notification badge color
                        shape: BoxShape.circle, // Circular badge
                      ),
                      child: const Center(
                        child: Text(
                          '3', // Notification count
                          style: TextStyle(
                            color: Colors.white, // White text inside badge
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageCardScreen()),
                );
              },
              child: Card(
                color: isDarkMode
                    ? Colors.transparent
                    : Colors.black, // Transparent in dark mode
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isDarkMode
                        ? const LinearGradient(
                      colors: [
                        Color(0xFF1E1E1E),
                        Color(0xFF1E1E1E),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                        : null,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // Name and Card Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: isDarkMode
                              ? LinearGradient(
                            colors: [
                              Color(0xFFD9D9D9),
                              Color(0xFFD9D9D9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                              : null, // No gradient in light mode
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Thanh Nhan Pham',
                              style: TextStyle(
                                color: isDarkMode ? Colors.black : Colors.white, // Black text in dark mode
                                fontSize: 16, // Reduced font size
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '**** 0000',
                              style: TextStyle(
                                color: isDarkMode ? Colors.black : Colors.white,
                                fontSize: 18, // Reduced font size
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isBalanceVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: isDarkMode ? Colors.black : Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isBalanceVisible = !_isBalanceVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      // Balance and Account Number Section
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: isDarkMode
                              ? LinearGradient(
                            colors: [
                              Color(0xFFFFFFFF), // Light grey color for the upper part
                              Color(0xFFFFFFFF), // Slightly darker grey for the lower part
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )
                              : LinearGradient(
                            colors: [
                              Color(0xFF000000), // Light grey in dark mode
                              Color(0xFF3A3A3A), // Dark grey color for the lower part
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Available balance',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.black : Colors.white, // Black text in dark mode
                                  fontSize: 16, // Reduced font size
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Balance Text
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    color: isDarkMode ? Colors.black : Colors.white, // Black text in dark mode
                                  ),
                                  children: [
                                    TextSpan(
                                      text: _isBalanceVisible ? 'INR ' : '',
                                      style: TextStyle(
                                        fontSize: 28, // Reduced font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _isBalanceVisible ? '1,368' : '******',
                                      style: const TextStyle(
                                        fontSize: 48, // Reduced font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _isBalanceVisible ? ' .00' : '',
                                      style: const TextStyle(
                                        fontSize: 28, // Reduced font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Account *****8886',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.black : Colors.white, // Black text in dark mode
                                  fontSize: 16, // Reduced font size
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Send Money Section
            const Text(
              'Send money',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Reduced font size
            ),
            const SizedBox(height: 16),

            // Make the Row scrollable horizontally
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: [
                  _buildSendMoneyAvatar(
                    'Transfer',
                    imageAsset: isDarkMode ? 'assets/images/trackon.png' // Visa logo
                        : 'assets/images/iconbutton.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),
                      );
                    },
                  ),
                  _buildSendMoneyAvatar('James', imageAsset: 'assets/images/person1.png'),
                  _buildSendMoneyAvatar('Michael H.', imageAsset: 'assets/images/person2.png'),
                  _buildSendMoneyAvatar('Olivia', imageAsset: 'assets/images/person3.png'),
                  _buildSendMoneyAvatar('William A.', imageAsset: 'assets/images/person4.png'),
                  _buildSendMoneyAvatar('James', imageAsset: 'assets/images/person1.png'),
                  _buildSendMoneyAvatar('Michael H.', imageAsset: 'assets/images/person2.png'),
                  _buildSendMoneyAvatar('Olivia', imageAsset: 'assets/images/person3.png'),
                  _buildSendMoneyAvatar('William A.', imageAsset: 'assets/images/person4.png'),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Transaction History Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Reduced font size
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionSearchScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Today',
                style: TextStyle(fontSize: 18, color: Colors.grey), // Reduced font size
              ),
            ),
            const SizedBox(height: 5),

            // Transaction Tiles
            _buildTransactionTile(
                'HSBC', 'Payment for invoice\n #12345.', -1430,
                imageAsset: 'assets/images/banklogo.png'),
            const Divider(
              indent: 75,
            ),
            _buildTransactionTile(
                'Bank of America', 'Monthly rent payment', -24,
                imageAsset: 'assets/images/banklogo1.png'),
            const Divider(indent: 75,),
            _buildTransactionTile('Transfer', 'Monthly EMI Due', 1368,
                imageAsset: 'assets/images/Mastercard.png'),
            const Divider(indent: 75,),
            _buildTransactionTile(
                'Bank of America', 'Monthly rent payment', -24,
                imageAsset: 'assets/images/banklogo1.png'),
            const Divider(indent: 75,),
            _buildTransactionTile('Transfer', 'Monthly EMI Due', 1368,
                imageAsset: 'assets/images/Mastercard.png'),
            const Divider(indent: 75,),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
