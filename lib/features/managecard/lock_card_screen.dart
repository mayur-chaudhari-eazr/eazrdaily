import 'package:flutter/material.dart';

class LockCardBottomSheet extends StatefulWidget {
  final bool isDarkMode;
  final bool isLocked;

  const LockCardBottomSheet({Key? key, required this.isDarkMode, required this.isLocked}) : super(key: key);

  @override
  _LockCardBottomSheetState createState() => _LockCardBottomSheetState();
}

class _LockCardBottomSheetState extends State<LockCardBottomSheet> {
  late bool isLocked;

  @override
  void initState() {
    super.initState();
    isLocked = widget.isLocked; // Initialize with current lock state
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? Colors.grey[900] : Colors.white, // Screen background based on dark mode
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: widget.isDarkMode ? Colors.white : Colors.black),
              onPressed: () {
                Navigator.pop(context, isLocked); // Return current lock state
              },
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: widget.isDarkMode ? Colors.white24 : Colors.grey[200],
                radius: 24,
                child: Icon(Icons.lock, color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lock card',
                    style: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isLocked
                        ? 'The card is locked, \nyou cannot make transactions.'
                        : 'The card is not locked, \nyou can make online payment \ntransactions via POS and at ATM.',
                    style: TextStyle(
                      color: widget.isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lock Card',
                style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              Switch(
                value: isLocked,
                activeColor: widget.isDarkMode ? Colors.black87 : Colors.black,
                onChanged: (bool value) {
                  setState(() {
                    isLocked = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLocked
                  ? () {
                Navigator.pop(context, isLocked); // Close the bottom sheet and return lock state when locked
              }
                  : null, // Disable button if not locked
              style: ElevatedButton.styleFrom(
                backgroundColor: isLocked
                    ? (widget.isDarkMode ? Colors.white : Colors.black)
                    : Colors.grey, // Grey when inactive, otherwise dynamic based on mode
                foregroundColor: isLocked
                    ? (widget.isDarkMode ? Colors.black : Colors.white)
                    : Colors.black54, // Lighter text for disabled button
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Confirm', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
