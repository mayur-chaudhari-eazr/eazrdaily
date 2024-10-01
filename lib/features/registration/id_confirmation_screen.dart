import 'package:eazrdaily/features/registration/facial_recognition_screen.dart';
import 'package:flutter/material.dart';

class IDConfirmationScreen extends StatelessWidget {
  const IDConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                Text(
                  'Please retake the photo.',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05, // Adjusted font size
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  'If any information is incorrect, please retake the ID photo.',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.04, // Responsive font size
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sex',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04, 
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Male',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.04, 
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.03),
                Text(
                  'ID information',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05, 
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                _buildInfoRow('Full name', 'Thanh Nhan', isDarkMode, screenSize),
                const Divider(),
                _buildInfoRow('Date of birth', '01/01/1999', isDarkMode, screenSize),
                const Divider(),
                _buildInfoRow('ID number', '12345678910', isDarkMode, screenSize),
                const Divider(),
                _buildInfoRow('Issue date', '01/01/2024', isDarkMode, screenSize),
                const Divider(),
                _buildInfoRow('Place of issue', 'HaNoi', isDarkMode, screenSize),
                const Divider(),
                _buildInfoRow('Address', '191 Hai Ba Trung,\nLong Bien, Ha Noi', isDarkMode, screenSize),
                SizedBox(height: screenSize.height * 0.02),
                _buildActionButton(context, 'Confirm', isDarkMode ? Colors.white : Colors.black, isDarkMode ? Colors.black : Colors.white, screenSize.height * 0.02),
                SizedBox(height: screenSize.height * 0.01),
                _buildActionButton(context, 'Retake', isDarkMode ? Colors.black : Colors.white, isDarkMode ? Colors.white : Colors.black, screenSize.height * 0.02, isOutlined: true),
                SizedBox(height: screenSize.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, bool isDarkMode, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenSize.width * 0.04, 
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: screenSize.width * 0.04, 
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text, Color backgroundColor, Color textColor, double buttonPadding, {bool isOutlined = false}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: buttonPadding),
          side: isOutlined ? BorderSide(color: textColor) : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FacialRecognitionScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
      ),
    );
  }
}
