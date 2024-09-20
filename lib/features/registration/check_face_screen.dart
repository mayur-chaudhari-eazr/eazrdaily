import 'package:flutter/material.dart';
import 'package:eazrdaily/features/registration/profile_verification_screen.dart'; // Import the ProfileVerificationScreen

class CheckFaceScreen extends StatefulWidget {
  const CheckFaceScreen({super.key});

  @override
  _CheckFaceScreenState createState() => _CheckFaceScreenState();
}

class _CheckFaceScreenState extends State<CheckFaceScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to ProfileVerificationScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileVerificationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the appbar to achieve transparency
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80), // Adjust height to avoid content getting under the AppBar
            Text(
              'Facial recognition',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'If any information is incorrect, please retake the ID photo.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // Enlarged Circular image with green dashed border
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const DashedCircle(
                      width: 300, // Increase width of the dashed circle
                      height: 300, // Increase height of the dashed circle
                      dashWidth: 6,
                      dashSpace: 4,
                      color: Colors.green, // Dashed border color
                    ),
                    CircleAvatar(
                      radius: 140, // Increase the radius of the image
                      backgroundColor: Colors.yellow[700],
                      backgroundImage: const AssetImage('assets/images/girlimage1.png'),
                    ),
                  ],
                ),
              ),
            ),
            // Camera button
            IconButton(
              onPressed: () {
                // Trigger camera action
              },
              icon: Icon(
                Icons.camera_alt,
                size: 40,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Custom painter for dashed circle
class DashedCircle extends StatelessWidget {
  final double width;
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DashedCircle({
    super.key,
    this.width = 160,
    this.height = 160,
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _DashedCirclePainter(dashWidth, dashSpace, color),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  _DashedCirclePainter(this.dashWidth, this.dashSpace, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double circumference = 2 * 3.141592653589793 * radius;

    double dashCount = (circumference / (dashWidth + dashSpace)).floorToDouble();
    double startAngle = -3.141592653589793 / 2;

    for (int i = 0; i < dashCount; ++i) {
      double currentStartAngle = startAngle + (i * (dashWidth + dashSpace)) / radius;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        currentStartAngle,
        dashWidth / radius,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
