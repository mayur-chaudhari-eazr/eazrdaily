import 'package:eazrdaily/features/createcard/setup_card_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utils/window.dart'; // Import your Window class for responsive design

class SetupDebitCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adapt the device screen size using the Window class
    final view = View.of(context);
    Window().adaptDeviceScreenSize(view: view);

    // Determine if the current theme is dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white, // Adjust background color based on theme
        body: Padding(
          padding: Window.getPadding(all: 16), // Responsive padding using Window class
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container for card image
              Container(
                width: double.infinity,
                height: Window.getVerticalSize(400), // Responsive container height
                decoration: BoxDecoration(
                  color: Colors.yellow, // Container background color
                  borderRadius: BorderRadius.circular(Window.getRadiusSize(20)), // Responsive border radius
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/new_card_image.png',
                    height: Window.getVerticalSize(300), // Responsive image height
                    fit: BoxFit.cover, // Ensures the image fills the space without distortion
                  ),
                ),
              ),
              SizedBox(height: Window.getVerticalSize(20)), // Responsive vertical spacing

              // Heading Text
              Text(
                'Setup Debit Card',
                style: TextStyle(
                  fontSize: Window.getFontSize(24), // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black, // Adjust text color based on theme
                ),
              ),
              SizedBox(height: Window.getVerticalSize(10)), // Responsive vertical spacing

              // Description Text
              Text(
                'Timeless and legendary. The classic original. Personalize it with your own custom drawing or stamp.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: Window.getFontSize(16), // Responsive font size
                  color: isDarkMode ? Colors.white70 : Colors.black54, // Adjust text color based on theme
                ),
              ),

              // Spacer to push button to the bottom
              const Spacer(),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetupCardScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.white : Colors.black, // Adjust button color based on theme
                    foregroundColor: isDarkMode ? Colors.black : Colors.white, // Adjust text color on the button
                    padding: Window.getPadding(top: 10, bottom: 10), // Reduce padding to avoid overflow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Window.getRadiusSize(8)), // Rounded button
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: Window.getFontSize(18), // Responsive button text font size
                    ),
                  ),
                ),
              ),
              SizedBox(height: Window.getVerticalSize(16)), // Responsive bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
