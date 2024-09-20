import 'package:eazrdaily/features/payment/bank_selection_screen.dart';
import 'package:eazrdaily/features/payment/barcode_screen.dart';
import 'package:eazrdaily/features/payment/phone_bank_number_selection_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearched = false; // This will control if the user has searched

  final List<Map<String, String>> _recipients = [
    {
      'name': 'Annie Jonhson',
      'accountNumber': '*****6688',
      'imageUrl': 'https://randomuser.me/api/portraits/women/1.jpg'
    },
    {
      'name': 'Emma',
      'accountNumber': '*****6243',
      'imageUrl': 'https://randomuser.me/api/portraits/women/2.jpg'
    },
    {
      'name': 'Elia Tynisha',
      'accountNumber': '*****6321',
      'imageUrl': 'https://randomuser.me/api/portraits/women/3.jpg'
    },
    {
      'name': 'James',
      'accountNumber': '*****8854',
      'imageUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'name': 'Olivia Mc',
      'accountNumber': '*****4315',
      'imageUrl': 'https://randomuser.me/api/portraits/women/4.jpg'
    },
  ];

  List<Map<String, String>> _filteredRecipients = [];

  @override
  void initState() {
    super.initState();
    _filteredRecipients = _recipients;
  }

  void _searchRecipient(String query) {
    setState(() {
      _isSearched = true; // Mark that the user has searched
      if (query.isEmpty) {
        _filteredRecipients = _recipients;
      } else {
        _filteredRecipients = _recipients
            .where((recipient) =>
            recipient['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Move over',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black, // Adjust text color for dark mode
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black), // Adjust icon color for dark mode
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, size: 30, color: isDarkMode ? Colors.white : Colors.black),
                title: Text('Account number', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                subtitle: Text(
                  'Including transfers within the same bank, interbank.',
                  style: TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.black87),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BankSelectionScreen()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.phone, size: 30, color: isDarkMode ? Colors.white : Colors.black),
                title: Text('Phone number', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                subtitle: Text(
                  'Includes bank transfers, interbank transfers, and phone support.',
                  style: TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.black87),
                ),
                onTap: () {
                  // Handle phone number transfer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  PhoneBankSelectionScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove AppBar shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black, // Text visible in both modes
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // New recipient button (Wider and bigger)
                Flexible(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                    child: ElevatedButton.icon(
                      onPressed: _showBottomSheet, // When pressed, show the bottom sheet
                      icon: Icon(
                          Icons.add,
                          color: isDarkMode ? Colors.black : Colors.white,
                          size: 30
                      ), // Adjust icon color for dark mode
                      label: Text(
                        'New recipient',
                        style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode ? Colors.black : Colors.white
                        ), // Adjust text color
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode ? Colors.white : Colors.black, // White button in dark mode
                        minimumSize: const Size(0, 55), // Height remains the same
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Curve the edges
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
                // Add some spacing between the button and the icon
                // QR Code Icon
                IconButton(
                  icon: Icon(
                      Icons.qr_code,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: 40
                  ),
                  onPressed: () {
                    // Handle QR code action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BarcodeScreen()),
                    );
                  },
                ),
              ],
            ),


            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Find saved recipients',
                prefixIcon: Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black), // Adjust icon color
                filled: true,
                fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              onChanged: (query) {
                _searchRecipient(query);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isSearched
                  ? _filteredRecipients.isEmpty
                  ? _buildNoResultsScreen(_searchController.text)
                  : ListView(
                children: [
                  const SectionHeader(title: 'A'),
                  ..._filteredRecipients.map((recipient) {
                    return RecipientTile(
                      name: recipient['name']!,
                      accountNumber: recipient['accountNumber']!,
                      imageUrl: recipient['imageUrl']!,
                    );
                  }),
                ],
              )
                  : ListView(
                children: const [
                  SectionHeader(title: 'A'),
                  RecipientTile(
                    name: 'Annie Jonhson',
                    accountNumber: '*****6688',
                    imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
                  ),
                  Divider(),
                  SectionHeader(title: 'E'),
                  RecipientTile(
                    name: 'Emma',
                    accountNumber: '*****6243',
                    imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
                  ),
                  Divider(),
                  RecipientTile(
                    name: 'Elia Tynisha',
                    accountNumber: '*****6321',
                    imageUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
                  ),
                  Divider(),
                  SectionHeader(title: 'J'),
                  RecipientTile(
                    name: 'James',
                    accountNumber: '*****8854',
                    imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
                  ),
                  Divider(),
                  SectionHeader(title: 'O'),
                  RecipientTile(
                    name: 'Olivia Mc',
                    accountNumber: '*****4315',
                    imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResultsScreen(String query) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/noresult.png'),
          const SizedBox(height: 24),
          Text(
            query.isEmpty ? "Start searching recipients" : "No results for $query",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            query.isEmpty ? "Use the search bar above" : 'You can search using the following keywords',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class RecipientTile extends StatelessWidget {
  final String name;
  final String accountNumber;
  final String imageUrl;

  const RecipientTile({super.key, 
    required this.name,
    required this.accountNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black), // Adjust text color for dark mode
      ),
      subtitle: Text(
        accountNumber,
        style: TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.black54), // Adjust subtitle text for dark mode
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black), // Adjust icon color
      onTap: () {
        // Handle tap to go to recipient details
      },
    );
  }
}
