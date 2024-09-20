import 'package:flutter/material.dart';

class GetCardStatementScreen extends StatefulWidget {
  const GetCardStatementScreen({Key? key}) : super(key: key);

  @override
  _GetCardStatementScreenState createState() => _GetCardStatementScreenState();
}

class _GetCardStatementScreenState extends State<GetCardStatementScreen> {
  String selectedCard = 'Debit card ****8866';
  String datePeriod = '1 - 18 Feb';
  String fileType = 'XLS';  // Default file type
  String language = 'English';  // Default language

  List<Map<String, String>> cards = [
    {'name': 'Debit card ****8866', 'image': 'assets/images/card1.png'},
    {'name': 'Credit card ****1234', 'image': 'assets/images/card2.png'},
    {'name': 'Business card ****5678', 'image': 'assets/images/card4.png'},
  ];

  List<String> fileTypes = ['PDF', 'XLS', 'CSV'];  // List of file types
  List<String> languages = ['Ukrainian', 'English', 'Vietnamese'];  // List of languages
  DateTimeRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get a card statement',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
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
            _buildListTile(
              context,
              icon: Icons.credit_card,
              title: 'Card',
              subtitle: selectedCard,
              onTap: () {
                _showCardSelection(context);
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.calendar_today,
              title: 'Date period',
              subtitle: selectedDateRange != null
                  ? '${selectedDateRange!.start.day} - ${selectedDateRange!.end.day} ${_getMonthName(selectedDateRange!.start.month)}'
                  : datePeriod,
              onTap: () {
                _showDatePicker(context); // Show bottom sheet date picker
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.insert_drive_file,
              title: 'Type of file',
              subtitle: fileType,
              onTap: () {
                _showFileTypeSelection(context); // Show bottom sheet file type picker
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.language,
              title: 'Language',
              subtitle: language,
              onTap: () {
                _showLanguageSelection(context); // Show bottom sheet language picker
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle get statement action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.white : Colors.black,  // White background in dark mode, Black in light mode
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Get statement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.black : Colors.white,  // Black text in dark mode, White in light mode
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black),
      onTap: onTap,
    );
  }

  void _showCardSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select a card',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...cards.map((card) => ListTile(
                leading: Image.asset(card['image']!, width: 50, height: 50),
                title: Text(card['name']!),
                trailing: selectedCard == card['name']
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    selectedCard = card['name']!;
                  });
                  Navigator.pop(context);
                },
              )),
            ],
          ),
        );
      },
    );
  }

  void _showFileTypeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Type of file',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...fileTypes.map((type) => ListTile(
                title: Text(type),
                trailing: fileType == type
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    fileType = type;
                  });
                  Navigator.pop(context);
                },
              )),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...languages.map((lang) => ListTile(
                title: Text(lang),
                trailing: language == lang
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    language = lang;
                  });
                  Navigator.pop(context);
                },
              )),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Select Date Range',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      setState(() {
                        datePeriod = '1 - 18 Feb';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: isDarkMode
                        ? const ColorScheme.dark(
                      primary: Colors.white,  // White color for selected circle in dark mode
                      onPrimary: Colors.black, // Black text color inside the selected circle
                      surface: Colors.grey,    // Background for other dates
                    )
                        : const ColorScheme.light(
                      primary: Colors.black,  // Black color for selected circle in light mode
                      onPrimary: Colors.white, // White text color inside the selected circle
                      surface: Colors.grey,   // Background for other dates
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    onDateChanged: (date) {
                      // Handle date change
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,  // Black in light mode, White in dark mode
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,  // Black text in dark mode, White in light mode
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  String _getMonthName(int month) {
    const monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }
}
