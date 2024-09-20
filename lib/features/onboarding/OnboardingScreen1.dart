import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:eazrdaily/features/onboarding/OnboardingScreen4.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  _OnboardingScreen1State createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onNextButtonPressed() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen4(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Size screenSize = MediaQuery.of(context).size; // Get screen size

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        body: Column(
          children: [
            // Flexible PageView for Onboarding Pages
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildOnboardingPage(
                      context,
                      screenSize: screenSize, // Pass screen size for responsiveness
                      color: Colors.purple[200],
                      image: 'assets/images/splash1image.png',
                      title: 'Take Control of\nyour finances',
                      description:
                      'Forget everything you know about the \ncomplicated world of finance.It is easy.',
                    ),
                    _buildOnboardingPage(
                      context,
                      screenSize: screenSize,
                      color: Colors.yellow[200],
                      image: 'assets/images/splash2image.png',
                      title: 'Stay on Top of\nYour Expenses',
                      description:
                      'Track and categorize your spending\nfor smarter financial decisions.',
                    ),
                    _buildOnboardingPage(
                      context,
                      screenSize: screenSize,
                      color: Colors.pink[200],
                      image: 'assets/images/splash3image.png',
                      title: 'Grow Your Savings',
                      description:
                      'Set goals and automate savings\nfor a brighter future.',
                    ),
                  ],
                ),
              ),
            ),
            // Button and SmoothPageIndicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth, // Matches button width dynamically
                        child: ElevatedButton(
                          onPressed: _onNextButtonPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            isDarkMode ? Colors.white : Colors.black,
                            foregroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            _currentPage == 2 ? 'Get Started' : 'Next',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.05, // Responsive font size
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Responsive Onboarding Page Builder
  Widget _buildOnboardingPage(
      BuildContext context, {
        required Size screenSize,
        required Color? color,
        required String image,
        required String title,
        required String description,
      }) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo Image
            Image.asset(
              'assets/images/onlylogo.png', // Replace with your logo path
              height: screenSize.height * 0.06, // Responsive logo size
            ),
            const Spacer(),
            // Onboarding Main Image
            Image.asset(
              image,
              height: screenSize.height * 0.4, // Responsive image height
              width: screenSize.width * 0.8, // Responsive image width
            ),
            SizedBox(height: screenSize.height * 0.03), // Responsive spacing
            // Title Text
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: isDarkMode ? Colors.black : Colors.black,
                  fontSize: screenSize.width * 0.08, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02), // Responsive spacing
            // Description Text
            Center(
              child: Text(
                description,
                style: TextStyle(
                  color: isDarkMode ? Colors.black87 : Colors.black87,
                  fontSize: screenSize.width * 0.045, // Responsive font size
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02), // Responsive spacing
            // SmoothPageIndicator
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: isDarkMode ? Colors.white : Colors.black,
                  dotHeight: screenSize.height * 0.015, // Responsive dot height
                  dotWidth: screenSize.height * 0.015, // Responsive dot width
                  expansionFactor: 2.5,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03), // Responsive spacing
          ],
        ),
      ),
    );
  }
}
