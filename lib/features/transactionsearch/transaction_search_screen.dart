import 'package:eazrdaily/features/transactionsearch/transaction_detail_screen.dart';
import 'package:flutter/material.dart';
import 'calender_widget.dart';
import 'search_results_bottom_sheet.dart'; // Assuming you have SearchResultsBottomSheet in a separate file

class TransactionSearchScreen extends StatefulWidget {
  const TransactionSearchScreen({super.key});

  @override
  _TransactionSearchScreenState createState() =>
      _TransactionSearchScreenState();
}

class _TransactionSearchScreenState extends State<TransactionSearchScreen> {
  String _selectedTab = 'All'; // State to track which tab is selected
  String _selectedFilter = 'Entire History'; // State to track selected date filter
  bool _showDateRangeFields = false; // To track whether to show 'From' and 'To' date fields
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,  // Allow resizing to avoid keyboard overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Find Transactions', style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView( // Makes the body scrollable
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSearchBar(context),
                    const SizedBox(height: 20),
                    _buildTabBar(), // Custom TabBar
                    const SizedBox(height: 20),
                    _buildFilterByDateSection(),
                    if (_showDateRangeFields) _buildDateRangeFields(), // Show date range if selected
                    const SizedBox(height: 20),
                    _buildFilterByAmountSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Next Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransactionDetailScreen(),),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18, // Increased font size for button
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Show the search results bottom sheet when search bar is tapped
        showSearchResultsBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white, // Black in dark mode, white in light mode
          borderRadius: BorderRadius.circular(8), // Rounded corners for a button-like appearance
          border: Border.all(
            color: isDarkMode ? Colors.white70 : Colors.black38, // Border color adapted to mode
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding for a button-like layout
        child: Row(
          children: [
            Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black), // Icon color changes based on mode
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Account Number or Message',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : Colors.black54, // Hint text color for both modes
                  ),
                  border: InputBorder.none, // Remove underline to fit button style
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                  )
                      : null,
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black, // Text color for both modes
                ),
                enabled: false, // Disable text field for tappable effect
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab('All'),
          _buildTab('Credits'),
          _buildTab('Debits'),
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isSelected = _selectedTab == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? (isDarkMode ? Colors.white : Colors.black) : (isDarkMode ? Colors.grey[800] : Colors.grey[300]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? (isDarkMode ? Colors.black : Colors.white) : (isDarkMode ? Colors.white : Colors.black),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterByDateSection() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Date',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _filterDateButton('Entire History'),
            _filterDateButton('7 Days Ago'),
            _filterDateButton('30 Days Ago'),
          ],
        ),
        Row(
          children: [
            _filterDateButton('60 Days Ago'),
            _filterDateButton('Other Time Periods'),
          ],
        ),
      ],
    );
  }

  Widget _filterDateButton(String label) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool isSelected = _selectedFilter == label;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFilter = label;
            _showDateRangeFields = (label == 'Other Time Periods');
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            color: isSelected ? (isDarkMode ? Colors.white : Colors.black) : (isDarkMode ? Colors.grey[800] : Colors.grey[300]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? (isDarkMode ? Colors.black : Colors.white) : (isDarkMode ? Colors.white : Colors.black),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateRangeFields() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Date Range',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildDateField('From')),
              const SizedBox(width: 10),
              Expanded(child: _buildDateField('To')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.calendar_today, color: isDarkMode ? Colors.white : Colors.black),
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await _showCalendarBottomSheet(context);
        if (pickedDate != null) {
          setState(() {
            // Handle selected date logic here
          });
        }
      },
    );
  }

  Future<DateTime?> _showCalendarBottomSheet(BuildContext context) async {
    return await showModalBottomSheet<DateTime>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const CalendarWidget();
      },
    );
  }

  Widget _buildFilterByAmountSection() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Amount',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildAmountField('Minimum')),
            const SizedBox(width: 10),
            Expanded(child: _buildAmountField('Maximum')),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountField(String label) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.attach_money, color: isDarkMode ? Colors.white : Colors.black),
        labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isDarkMode ? Colors.white70 : Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransactionDetailScreen(),),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode ? Colors.white : Colors.black,
            foregroundColor: isDarkMode ? Colors.black : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              fontSize: 18, // Increased font size for button
            ),
          ),
        ),
      ),
   );
  }
}
