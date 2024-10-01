import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // For circular chart
import 'dart:ui';
import '../../core/utils/window.dart'; // Import your Window class for responsive design

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Adapt device screen size using your Window class
    final view = View.of(context);
    Window().adaptDeviceScreenSize(view: view);

    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Transaction Statistics',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: Window.getFontSize(26), // Reduced font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        padding: Window.getPadding(all: 12), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12), // Reduced height
            Center(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Window.getFontSize(36), // Reduced font size from 48
                      ),
                      children: [
                        TextSpan(
                          text: '\$', // Small $ symbol
                          style: TextStyle(
                            fontSize: Window.getFontSize(24), // Reduced font size from 30
                          ),
                        ),
                        const TextSpan(text: '1,368'), // Main large number
                        TextSpan(
                          text: '.00', // Small .00 part
                          style: TextStyle(
                            fontSize: Window.getFontSize(24), // Reduced font size from 30
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Window.getVerticalSize(6)), // Reduced vertical size
                  Text(
                    "for May 2024",
                    style: TextStyle(
                      fontSize: Window.getFontSize(16), // Reduced font size from 20
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Window.getVerticalSize(20)), // Reduced vertical size

            // Circular charts
            Stack(
              alignment: Alignment.center,
              children: [
                // Grey chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('Remaining', 20, Colors.grey[600]!)],
                      innerRadius: Window.getHorizontalSize(100).toString(), // Reduced inner radius
                      radius: Window.getHorizontalSize(130).toString(), // Reduced radius
                      startAngle: 270,
                      endAngle: 630,
                      pointColorMapper: (_ChartData data, _) => data.color,
                      xValueMapper: (_ChartData data, _) => data.category,
                      yValueMapper: (_ChartData data, _) => data.value,
                      strokeWidth: 2,
                    ),
                  ],
                ),
                // Blue chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('POS', 20, Colors.blue)],
                      innerRadius: Window.getHorizontalSize(90).toString(),
                      radius: Window.getHorizontalSize(140).toString(),
                      startAngle: 400,
                      endAngle: 570,
                      pointColorMapper: (_ChartData data, _) => data.color,
                      xValueMapper: (_ChartData data, _) => data.category,
                      yValueMapper: (_ChartData data, _) => data.value,
                      cornerStyle: CornerStyle.endCurve,
                      strokeWidth: 2,
                    ),
                  ],
                ),
                // Yellow chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('Transfer', 60, Colors.yellow)],
                      innerRadius: Window.getHorizontalSize(80).toString(),
                      radius: Window.getHorizontalSize(140).toString(),
                      startAngle: 270,
                      endAngle: 486,
                      pointColorMapper: (_ChartData data, _) => data.color,
                      xValueMapper: (_ChartData data, _) => data.category,
                      yValueMapper: (_ChartData data, _) => data.value,
                      cornerStyle: CornerStyle.bothCurve,
                      strokeWidth: 2,
                    ),
                  ],
                ),
                // Center text container
                Positioned(
                  child: Container(
                    padding: Window.getPadding(all: 10), // Reduced padding
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[100] : Colors.grey[800],
                      borderRadius: BorderRadius.circular(Window.getRadiusSize(10)), // Reduced radius
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.black26 : Colors.grey.withOpacity(0.3),
                          blurRadius: Window.getHorizontalSize(8), // Reduced blur
                          spreadRadius: Window.getHorizontalSize(4), // Reduced spread
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      "\$10,125",
                      style: TextStyle(
                        color: isDarkMode ? Colors.black : Colors.white,
                        fontSize: Window.getFontSize(24), // Reduced font size
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Legends
            SizedBox(height: Window.getVerticalSize(24)), // Reduced vertical size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegend('POS', Colors.blue),
                SizedBox(width: Window.getHorizontalSize(12)), // Reduced spacing
                _buildLegend('Transfer', Colors.yellow),
              ],
            ),

            // Transaction details section
            SizedBox(height: Window.getVerticalSize(30)), // Reduced vertical size
            _buildTransactionItemWithImage(context, 'Transfer', '+1,230.00', 'POS', '*4243', 'assets/images/Avatar.png', isDarkMode),
            const Divider(), // Ensure Divider is visible
            _buildTransactionItemWithImage(context, 'Coffee world', '-32.26', 'Recreation & Entertainment', '', 'assets/images/iconbutton.png', isDarkMode),
            const SizedBox(height: 80), // Reduced extra spacing
          ],
        ),
      ),
    );
  }

  // Builds the legend items
  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: Window.getHorizontalSize(40), // Reduced width
          height: Window.getVerticalSize(20), // Reduced height
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(width: Window.getHorizontalSize(10)), // Reduced spacing
        Text(text, style: TextStyle(fontSize: Window.getFontSize(16))), // Reduced font size
      ],
    );
  }

  // Transaction items with images
  Widget _buildTransactionItemWithImage(BuildContext context, String title, String amount, String subTitle,
      [String? extraInfo, String imagePath = '', bool isDarkMode = false]) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double dynamicSpacing = screenHeight < 600
        ? Window.getVerticalSize(32) // Adjusted for smaller devices
        : Window.getVerticalSize(48); // Adjusted for larger devices

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  height: Window.getVerticalSize(32), // Reduced image size
                  width: Window.getHorizontalSize(32), // Reduced image size
                  fit: BoxFit.cover,
                ),
                SizedBox(width: Window.getHorizontalSize(10)), // Reduced spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Window.getFontSize(16), // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Window.getFontSize(14), // Reduced font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: Window.getFontSize(16), // Reduced font size
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Chart data model class
class _ChartData {
  final String category;
  final double value;
  final Color color;

  _ChartData(this.category, this.value, this.color);
}
