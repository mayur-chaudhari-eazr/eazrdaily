import 'package:eazrdaily/features/payment/account_number_entry_screen.dart';
import 'package:flutter/material.dart';

class BankSelectionScreen extends StatefulWidget {
  const BankSelectionScreen({super.key});

  @override
  _BankSelectionScreenState createState() => _BankSelectionScreenState();
}

class _BankSelectionScreenState extends State<BankSelectionScreen> {
  final List<Map<String, dynamic>> banks = [
    {'name': 'HSBC', 'imageUrl': 'assets/images/hsbc.png'},
    {'name': 'Citi', 'imageUrl': 'assets/images/citi.png'},
    {'name': 'Bank of America', 'imageUrl': 'assets/images/bankofamerica.png'},
    {'name': 'Deutsche', 'imageUrl': 'assets/images/deutsche.png'},
    {'name': 'Mizuho', 'imageUrl': 'assets/images/mizuho.png'},
    {'name': 'Santander', 'imageUrl': 'assets/images/santander.png'},
    {'name': 'MUFG', 'imageUrl': 'assets/images/mufg.png'},
    {'name': 'Barclays', 'imageUrl': 'assets/images/barclays.png'},
  ];

  List<Map<String, dynamic>> filteredBanks = [];

  @override
  void initState() {
    super.initState();
    filteredBanks = banks; // Initially display all banks
  }

  void _filterBanks(String query) {
    final results = banks.where((bank) {
      final bankNameLower = bank['name']!.toLowerCase();
      final queryLower = query.toLowerCase();
      return bankNameLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredBanks = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove AppBar shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black, size: 30), // Adapt icon color to dark mode
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
          children: [
            Text(
              'Which bank do you want to transfer to?',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black, // Text color adapts to dark mode
                fontSize: 28, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Add spacing between the two texts
            Text(
              'Select the bank for your transfer',
              style: TextStyle(
                color: isDarkMode ? Colors.grey[400] : Colors.grey,
                fontSize: 20, // Increased font size
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Find a bank',
                hintStyle: TextStyle(fontSize: 18, color: isDarkMode ? Colors.grey[400] : Colors.black54), // Hint text adapts to dark mode
                prefixIcon: Icon(Icons.search, size: 28, color: isDarkMode ? Colors.white : Colors.black), // Increased search icon size, adapts to mode
                filled: true,
                fillColor: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: isDarkMode ? Colors.grey : Colors.grey), // Dashed underline style
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // Solid underline style when focused
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black), // Input text adapts to mode
              onChanged: (query) => _filterBanks(query), // Handle search functionality
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBanks.length,
                itemBuilder: (context, index) {
                  final bank = filteredBanks[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding between each list item
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(bank['imageUrl']),
                            radius: 30, // Increase size of bank icon
                          ),
                          title: Text(
                            bank['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? Colors.white : Colors.black, // Text adapts to dark mode
                            ),
                          ),
                          onTap: () {
                            // Navigate to the account number entry screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountNumberScreen(
                                  bankName: bank['name'],
                                  bankLogo: bank['imageUrl'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: isDarkMode ? Colors.grey[700] : Colors.grey, // Divider adapts to dark mode
                      ), // Divider between list items
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
