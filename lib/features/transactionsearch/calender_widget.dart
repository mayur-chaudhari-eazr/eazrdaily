import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  late DateTime _currentDisplayedMonth;

  @override
  void initState() {
    super.initState();
    _currentDisplayedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  void _goToNextMonth() {
    setState(() {
      _currentDisplayedMonth = DateTime(
          _currentDisplayedMonth.year, _currentDisplayedMonth.month + 1);
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentDisplayedMonth = DateTime(
          _currentDisplayedMonth.year, _currentDisplayedMonth.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    final double screenWidth = mediaQuery.size.width;

    return FractionallySizedBox(
      heightFactor: 0.75, // Adjust height dynamically based on screen size
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context, isDarkMode),
            const SizedBox(height: 10),
            Divider(color: isDarkMode ? Colors.grey[700] : Colors.grey[400]),
            const SizedBox(height: 10),
            _buildMonthNavigation(isDarkMode),
            const SizedBox(height: 10),
            // Responsive CalendarDatePicker with custom colors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: screenHeight * 0.4, // Dynamic height for the calendar
                width: screenWidth * 0.9,   // Dynamic width for the calendar
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: isDarkMode
                        ? ColorScheme.dark(
                      primary: Colors.white, // White selected circle in dark mode
                      onPrimary: Colors.black, // Black text inside the selected circle
                    )
                        : ColorScheme.light(
                      primary: Colors.black, // Black selected circle in light mode
                      onPrimary: Colors.white, // White text inside the selected circle
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    currentDate: _selectedDate,
                    initialCalendarMode: DatePickerMode.day,
                    onDateChanged: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedDate);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.white : Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Select',
                style: TextStyle(
                  color: isDarkMode ? Colors.black : Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Select Date',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildMonthNavigation(bool isDarkMode) {
    final monthYearFormat = DateFormat.yMMMM();
    String formattedMonthYear = monthYearFormat.format(_currentDisplayedMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: _goToPreviousMonth,
        ),
        Text(
          formattedMonthYear,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        IconButton(
          icon: Icon(Icons.chevron_right, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: _goToNextMonth,
        ),
      ],
    );
  }
}
