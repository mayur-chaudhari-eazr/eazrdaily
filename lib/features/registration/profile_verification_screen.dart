import 'package:eazrdaily/features/registration/select_company_screen.dart';
import 'package:flutter/material.dart';

class ProfileVerificationScreen extends StatefulWidget {
  const ProfileVerificationScreen({super.key});

  @override
  _ProfileVerificationScreenState createState() => _ProfileVerificationScreenState();
}

class _ProfileVerificationScreenState extends State<ProfileVerificationScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectCompanyScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Size screenSize = MediaQuery.of(context).size;

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.02), // Responsive top spacing
              Text(
                'Hold on a moment',
                style: TextStyle(
                  fontSize: screenSize.width * 0.06, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: screenSize.height * 0.01), // Responsive spacing
              Text(
                'We are analyzing your profile verification.',
                style: TextStyle(
                  fontSize: screenSize.width * 0.04, // Responsive font size
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.05), // Responsive spacing
              // Placeholder for rocket image
              Image.asset(
                'assets/images/ac_verify.png',
                width: screenSize.width * 0.7, // Responsive image width
                height: screenSize.height * 0.3, // Responsive image height
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenSize.height * 0.05), // Responsive spacing
              // Status list
              _buildStatusTile(
                icon: Icons.check_circle,
                color: isDarkMode ? Colors.white : Colors.black,
                text: 'Documents have been uploaded',
                isDarkMode: isDarkMode,
              ),
              _buildLoadingStatusTile(
                color: Colors.grey,
                text: 'Documents accepted',
                isDarkMode: isDarkMode,
              ),
              _buildLoadingStatusTile(
                color: Colors.grey,
                text: 'Selfie accepted',
                isDarkMode: isDarkMode,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.02,
                    horizontal: screenSize.width * 0.15,
                  ), // Responsive button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Handle facial recognition start
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileVerificationScreen()),
                  );
                },
                child: FittedBox(
                  child: Text(
                    'Start facial recognition',
                    style: TextStyle(
                      color: isDarkMode ? Colors.black : Colors.white,
                      fontSize: screenSize.width * 0.045, // Responsive font size
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02), // Responsive bottom spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTile({
    required IconData icon,
    required Color color,
    required String text,
    required bool isDarkMode,
  }) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01), // Responsive padding
      child: Row(
        children: [
          Icon(icon, size: screenSize.width * 0.07, color: color), // Responsive icon size
          SizedBox(width: screenSize.width * 0.03), // Responsive spacing
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: screenSize.width * 0.04, color: isDarkMode ? Colors.white70 : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingStatusTile({
    required Color color,
    required String text,
    required bool isDarkMode,
  }) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01), // Responsive padding
      child: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.07, // Responsive size
            height: screenSize.width * 0.07, // Responsive size
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: color,
            ),
          ),
          SizedBox(width: screenSize.width * 0.03), // Responsive spacing
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: screenSize.width * 0.04, color: isDarkMode ? Colors.white70 : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
