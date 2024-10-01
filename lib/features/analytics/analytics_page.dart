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
            fontSize: Window.getFontSize(26), // Font size adjusted for readability
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Colors.white, // Set background color based on mode
      body: SingleChildScrollView(
        padding: Window.getPadding(all: 12), // Padding as per responsive design
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Window.getFontSize(36), // Large font size
                        color: isDarkMode ? Colors.white : Colors.black, // Color based on mode
                      ),
                      children: [
                        TextSpan(
                          text: '\$',
                          style: TextStyle(
                            fontSize: Window.getFontSize(24),
                          ),
                        ),
                        const TextSpan(text: '1,368'), // Main large number
                        TextSpan(
                          text: '.00',
                          style: TextStyle(
                            fontSize: Window.getFontSize(24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Window.getVerticalSize(6)),
                  Text(
                    "for May 2024",
                    style: TextStyle(
                      fontSize: Window.getFontSize(16),
                      color: isDarkMode ? Colors.grey[300] : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Window.getVerticalSize(20)),

            // Circular charts
            Stack(
              alignment: Alignment.center,
              children: [
                // Grey chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('Remaining', 20, Colors.grey[600]!)],
                      innerRadius: Window.getHorizontalSize(100).toString(),
                      radius: Window.getHorizontalSize(130).toString(),
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
                    padding: Window.getPadding(all: 10),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(Window.getRadiusSize(10)),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.black26 : Colors.grey.withOpacity(0.3),
                          blurRadius: Window.getHorizontalSize(8),
                          spreadRadius: Window.getHorizontalSize(4),
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      "\$10,125",
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: Window.getFontSize(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Legends
            SizedBox(height: Window.getVerticalSize(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegend('POS', Colors.blue, isDarkMode), // Pass isDarkMode here
                SizedBox(width: Window.getHorizontalSize(12)),
                _buildLegend('Transfer', Colors.yellow, isDarkMode), // Pass isDarkMode here
              ],
            ),

            // Transaction details section
            SizedBox(height: Window.getVerticalSize(30)),
            _buildTransactionItemWithImage(context, 'Transfer', '+1,230.00', 'POS', '*4243', 'assets/images/Avatar.png', isDarkMode),
            const Divider(color: Colors.grey), // Ensure Divider is visible in dark mode
            _buildTransactionItemWithImage(context, 'Coffee world', '-32.26', 'Recreation & Entertainment', '', 'assets/images/iconbutton.png', isDarkMode),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // Builds the legend items
  Widget _buildLegend(String text, Color color, bool isDarkMode) {
    return Row(
      children: [
        Container(
          width: Window.getHorizontalSize(40),
          height: Window.getVerticalSize(20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(width: Window.getHorizontalSize(10)),
        Text(
          text,
          style: TextStyle(
            fontSize: Window.getFontSize(16),
            color: isDarkMode ? Colors.white : Colors.black, // Set text color based on dark mode
          ),
        ),
      ],
    );
  }

  // Transaction items with images
  Widget _buildTransactionItemWithImage(BuildContext context, String title, String amount, String subTitle,
      [String? extraInfo, String imagePath = '', bool isDarkMode = false]) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double dynamicSpacing = screenHeight < 600
        ? Window.getVerticalSize(32)
        : Window.getVerticalSize(48);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  height: Window.getVerticalSize(32),
                  width: Window.getHorizontalSize(32),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: Window.getHorizontalSize(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Window.getFontSize(16),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Window.getFontSize(14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: Window.getFontSize(16),
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
