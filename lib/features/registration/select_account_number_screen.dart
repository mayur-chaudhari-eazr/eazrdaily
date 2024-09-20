import 'package:eazrdaily/features/registration/create_account_number_screen.dart';
import 'package:flutter/material.dart';

class SelectAccountNumberScreen extends StatefulWidget {
  const SelectAccountNumberScreen({super.key});

  @override
  _SelectAccountNumberScreenState createState() =>
      _SelectAccountNumberScreenState();
}

class _SelectAccountNumberScreenState extends State<SelectAccountNumberScreen> {
  String selectedAccountType = ''; // Track the selected account type

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar for both modes
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
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
            Text(
              'Select account number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 100),
            // Regular account card
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAccountType = 'Regular account';
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountNumberScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedAccountType == 'Regular account'
                            ? (isDarkMode ? Colors.white : Colors.black)
                            : (isDarkMode ? Colors.white54 : Colors.grey),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.pink[100],
                          child: const Icon(Icons.credit_card, color: Colors.pink),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Regular account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Completely free with full features\nand benefits of a payment account.',
                          style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Nice account number card
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAccountType = 'Nice account number';
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountNumberScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedAccountType == 'Nice account number'
                            ? (isDarkMode ? Colors.white : Colors.black)
                            : (isDarkMode ? Colors.white54 : Colors.grey),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.yellow[100],
                          child: Icon(Icons.monetization_on, color: Colors.yellow[700]),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Nice account number',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Choose a lucky day for instant wealth\nand luck (price includes VAT).',
                          style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
