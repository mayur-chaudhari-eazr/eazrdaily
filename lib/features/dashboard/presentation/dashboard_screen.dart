import 'package:eazrdaily/features/analytics/analytics_page.dart';
import 'package:eazrdaily/features/dashboard/bloc/bottom_nav_cubit.dart';
import 'package:eazrdaily/features/home/home_page.dart';
import 'package:eazrdaily/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  final List<Widget> _pages = [
    HomePage(),
    AnalyticsPage(),
    ProfilePage(),
  ];

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Display the page based on the selected index
          BlocBuilder<BottomNavCubit, int>(
            builder: (context, selectedIndex) {
              return _pages[selectedIndex];
            },
          ),

          // Curved BottomSheet with Floating BottomNavigationBar
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildCurvedBottomSheet(context, isDarkMode),
          ),

          // Floating BottomNavigationBar
          Positioned(
            bottom: 20, // Floating effect by raising the BottomNavigationBar
            left: 20,
            right: 20,
            child: _buildFloatingBottomNavigationBar(context, isDarkMode),
          ),
        ],
      ),
    );
  }

  // Function to build the curved BottomSheet
  Widget _buildCurvedBottomSheet(BuildContext context, bool isDarkMode) {
    return Container(
      height: 90, // Height of the curved BottomSheet
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.grey[200], // BottomNavigationBar's color
      ),
    );
  }

  // Function to build the floating BottomNavigationBar with swapped colors
  Widget _buildFloatingBottomNavigationBar(BuildContext context, bool isDarkMode) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Rounded corners for the floating bar
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.grey[200], // BottomSheet's color
        ),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, selectedIndex) {
            return BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
              // Retaining theme colors for selected and unselected items
              selectedItemColor: isDarkMode ? Colors.white : Colors.black, // Original colors
              unselectedItemColor: isDarkMode ? Colors.grey[600] : Colors.grey, // Original colors
              
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],

              showSelectedLabels: false, // Hide labels
              showUnselectedLabels: false, // Hide labels

              // Custom icon size for selected and unselected states
              selectedIconTheme: const IconThemeData(
                size: 30, // Adjust icon size for selected state
              ),
              unselectedIconTheme: const IconThemeData(
                size: 24, // Smaller icon size for unselected state
              ),
            );
          },
        ),
      ),
    );
  }
}
