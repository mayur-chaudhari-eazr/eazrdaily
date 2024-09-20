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
            fontSize: Window.getFontSize(20), // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        padding: Window.getPadding(all: 16), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Window.getFontSize(48), // Adjust font size
                      ),
                      children: [
                        TextSpan(
                          text: '\$', // Small $ symbol
                          style: TextStyle(
                            fontSize: Window.getFontSize(30), // Adjust size
                          ),
                        ),
                        const TextSpan(text: '1,368'), // Main large number
                        TextSpan(
                          text: '.00', // Small .00 part
                          style: TextStyle(
                            fontSize: Window.getFontSize(30), // Adjust size
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Window.getVerticalSize(8)),
                  Text(
                    "for May 2024",
                    style: TextStyle(
                      fontSize: Window.getFontSize(20), // Adjust font size
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Window.getVerticalSize(24)),

            // Circular charts
            Stack(
              alignment: Alignment.center,
              children: [
                // Grey chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('Remaining', 20, Colors.grey[600]!)],
                      innerRadius: Window.getHorizontalSize(130).toString(), // Responsive inner radius
                      radius: Window.getHorizontalSize(157).toString(), // Responsive radius
                      startAngle: 270,
                      endAngle: 630,
                      pointColorMapper: (_ChartData data, _) => data.color,
                      xValueMapper: (_ChartData data, _) => data.category,
                      yValueMapper: (_ChartData data, _) => data.value,
                      strokeWidth: 2, // Adjust stroke width
                    ),
                  ],
                ),
                // Blue chart
                SfCircularChart(
                  series: <CircularSeries>[
                    DoughnutSeries<_ChartData, String>(
                      dataSource: [_ChartData('POS', 20, Colors.blue)],
                      innerRadius: Window.getHorizontalSize(120).toString(),
                      radius: Window.getHorizontalSize(160).toString(),
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
                      innerRadius: Window.getHorizontalSize(110).toString(),
                      radius: Window.getHorizontalSize(160).toString(),
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
                    padding: Window.getPadding(all: 12),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[100] : Colors.grey[800],
                      borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.black26 : Colors.grey.withOpacity(0.3),
                          blurRadius: Window.getHorizontalSize(10),
                          spreadRadius: Window.getHorizontalSize(5),
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      "\$10,125",
                      style: TextStyle(
                        color: isDarkMode ? Colors.black : Colors.white,
                        fontSize: Window.getFontSize(30), // Adjust font size
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Legends
            SizedBox(height: Window.getVerticalSize(32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegend('POS', Colors.blue),
                SizedBox(width: Window.getHorizontalSize(16)),
                _buildLegend('Transfer', Colors.yellow),
              ],
            ),

            // Transaction details section
            SizedBox(height: Window.getVerticalSize(40)),
            _buildTransactionItemWithImage(context, 'Transfer', '+1,230.00', 'POS', '*4243', 'assets/images/Avatar.png', isDarkMode),
            const Divider(), // Ensure Divider is visible
            _buildTransactionItemWithImage(context, 'Coffee world', '-32.26', 'Recreation & Entertainment', '', 'assets/images/iconbutton.png', isDarkMode),
            SizedBox(height: 100,)
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
          width: Window.getHorizontalSize(50),
          height: Window.getVerticalSize(30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(width: Window.getHorizontalSize(12)),
        Text(text, style: TextStyle(fontSize: Window.getFontSize(20))), // Adjust font size
      ],
    );
  }

  // Transaction items with images
  Widget _buildTransactionItemWithImage(BuildContext context, String title, String amount, String subTitle,
      [String? extraInfo, String imagePath = '', bool isDarkMode = false]) {
    // Determine the appropriate vertical spacing based on screen height
    final screenHeight = MediaQuery.of(context).size.height;
    final double dynamicSpacing = screenHeight < 600
        ? Window.getVerticalSize(40) // Smaller devices get smaller spacing
        : Window.getVerticalSize(60); // Larger devices get more spacing

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  height: Window.getVerticalSize(40), // Responsive size
                  width: Window.getHorizontalSize(40), // Responsive size
                  fit: BoxFit.cover,
                ),
                SizedBox(width: Window.getHorizontalSize(12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: Window.getFontSize(20), // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Window.getFontSize(16), // Responsive font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: Window.getFontSize(20), // Responsive font size
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
