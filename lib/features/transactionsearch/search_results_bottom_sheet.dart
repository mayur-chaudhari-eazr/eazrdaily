import 'package:flutter/material.dart';

class SearchResultsBottomSheet extends StatelessWidget {
  const SearchResultsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      padding: const EdgeInsets.all(24.0), // Increased padding for larger UI
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchResultsTitle(context),
          const SizedBox(height: 24), // Increased space between title and list
          Expanded(
            child: ListView(
              children: [
                _buildTransactionDate('Today'),
                _buildTransactionItem(
                  logo: Icons.account_balance,
                  name: 'HSBC',
                  description: 'Payment for invoice #12345',
                  amount: '- 1,430.00',
                  isPositive: false,
                ),
                _buildTransactionItem(
                  logo: Icons.account_balance,
                  name: 'Bank of America',
                  description: 'Monthly rent payment',
                  amount: '- 24.00',
                  isPositive: false,
                ),
                _buildTransactionItem(
                  logo: Icons.credit_card,
                  name: 'Transfer',
                  description: 'Gift for your birthday.',
                  amount: '+ 16.00',
                  isPositive: true,
                ),
                _buildTransactionDate('Yesterday'),
                _buildTransactionItem(
                  logo: Icons.person,
                  name: 'Olivia',
                  description: 'Reimbursement for dinner',
                  amount: '+ 431.09',
                  isPositive: true,
                ),
                _buildTransactionItem(
                  logo: Icons.apple,
                  name: 'Apple',
                  description: 'Loan repayment as agreed.',
                  amount: '- 43.02',
                  isPositive: false,
                ),
                _buildTransactionDate('16 May 2024'),
                _buildTransactionItem(
                  logo: Icons.credit_card,
                  name: 'Transfer',
                  description: 'Contribution to the group fund.',
                  amount: '+ 31.24',
                  isPositive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResultsTitle(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Search Results',
          style: TextStyle(
            fontSize: 28, // Increased font size
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black, // Dark mode support
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildTransactionDate(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 18, // Increased font size
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData logo,
    required String name,
    required String description,
    required String amount,
    required bool isPositive,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Adjusted padding
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[700], // Increased avatar size
            child: Icon(logo, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16, // Increased font size
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18, // Increased font size
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

void showSearchResultsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return const FractionallySizedBox(
        heightFactor: 0.9,
        child: SearchResultsBottomSheet(),
      );
    },
  );
}
