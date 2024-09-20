import 'package:eazrdaily/features/managecard/set_limit_success_screen.dart';
import 'package:flutter/material.dart';

class SetLimitAmountScreen extends StatefulWidget {
  final String limitType;
  final String currentLimit;

  const SetLimitAmountScreen({
    Key? key,
    required this.limitType,
    required this.currentLimit,
  }) : super(key: key);

  @override
  _SetLimitAmountScreenState createState() => _SetLimitAmountScreenState();
}

class _SetLimitAmountScreenState extends State<SetLimitAmountScreen> {
  String selectedLimit = '';
  bool isOtherSelected = false;
  final TextEditingController _customAmountController = TextEditingController();
  bool _isNextButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    selectedLimit = widget.currentLimit; // Set initial limit from passed data
    _customAmountController.addListener(_checkIfAmountEntered);
  }

  void _checkIfAmountEntered() {
    setState(() {
      _isNextButtonEnabled = _customAmountController.text.isNotEmpty || !isOtherSelected;
    });
  }

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Set Card Limit',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 24 * textScaleFactor,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your current ${widget.limitType} is',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18 * textScaleFactor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'USD ${isOtherSelected && _customAmountController.text.isNotEmpty ? _customAmountController.text : selectedLimit}',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28 * textScaleFactor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Change Limit',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18 * textScaleFactor,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _limitButton('10,000'),
                  _limitButton('20,000'),
                  _limitButton('50,000'),
                  _limitButton('100,000'),
                  _limitButton('Other', isOther: true),
                ],
              ),
              const SizedBox(height: 20),
              if (isOtherSelected)
                TextField(
                  controller: _customAmountController,
                  decoration: InputDecoration(
                    labelText: 'Enter Custom Amount',
                    labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                ),
              SizedBox(height: size.height * 0.05),
              ElevatedButton(
                onPressed: _isNextButtonEnabled
                    ? () {
                  String limitAmount = isOtherSelected && _customAmountController.text.isNotEmpty
                      ? _customAmountController.text
                      : selectedLimit;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetLimitSuccessScreen(limitAmount: limitAmount), // Passing the dynamic limit
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isNextButtonEnabled
                      ? (isDarkMode ? Colors.white : Colors.black)
                      : Colors.grey,
                  foregroundColor: _isNextButtonEnabled
                      ? (isDarkMode ? Colors.black : Colors.white)
                      : Colors.white70,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20 * textScaleFactor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _limitButton(String amount, {bool isOther = false}) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (isOther) {
            isOtherSelected = true;
            selectedLimit = '';
          } else {
            selectedLimit = amount;
            _customAmountController.clear();
            isOtherSelected = false;
          }
          _isNextButtonEnabled = true;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: (selectedLimit == amount || (isOther && isOtherSelected))
            ? (isDarkMode ? Colors.white : Colors.black)
            : Colors.grey[700],
        foregroundColor: isDarkMode ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        amount,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
