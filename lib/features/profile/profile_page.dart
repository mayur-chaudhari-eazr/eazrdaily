import 'package:eazrdaily/features/profile/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider to access AppTheme
import '../../config/theme/app_theme.dart'; // Import AppTheme

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEnglish = true; // Language toggle state (EN or FR)

  // Toggles the theme between dark and light modes
  void _toggleDarkMode(bool isDarkModeEnabled) {
    final themeProvider = Provider.of<AppTheme>(context, listen: false);
    themeProvider.toggleTheme(isDarkModeEnabled); // Toggle theme globally
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Retrieve the active theme
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        title: Text(
          'My Account',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 26, // Larger title font size for prominence
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black, // Change text color based on theme
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // White in light mode, black in dark mode
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Change icon color based on theme
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Match the screen color to the app bar color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60, // Larger avatar size for impact
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/1.jpg', // Replace with your image URL
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Thanh Nhan Pham',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 28, // Larger name font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'bredarstudio@ui8.com',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildProfileOption(
                context,
                icon: Icons.lock_outline,
                title: 'Personal Info',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
                  );
                },
              ),
              const Divider(), // Divider after each option
              _buildProfileOption(
                context,
                icon: Icons.visibility_outlined,
                title: 'Privacy & Policy',
                onTap: () {
                  // Handle Privacy Policy action
                },
              ),
              const Divider(),
              _buildProfileOption(
                context,
                icon: Icons.help_outline,
                title: 'Help & Center',
                onTap: () {
                  // Handle Help & Center action
                },
              ),
              const Divider(),
              _buildCustomSwitchOption(
                context,
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                isDarkMode: isDarkMode,
                value: Provider.of<AppTheme>(context).themeMode == ThemeMode.dark, // Use provider to check the theme mode
                onChanged: _toggleDarkMode, // Handle dark mode toggle
              ),
              const Divider(),
              _buildCustomLanguageToggle(context),
              const Divider(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    ThemeData theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: isDarkMode ? Colors.white : Colors.black, // Adjust icon color based on theme
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 20, // Larger text size for the options
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: isDarkMode ? Colors.white : Colors.black, size: 20),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0), // Add more vertical padding
    );
  }

  // Custom switch widget for dark mode
  Widget _buildCustomSwitchOption(BuildContext context,
      {required IconData icon,
        required String title,
        required bool value,
        required bool isDarkMode,
        required ValueChanged<bool> onChanged}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: isDarkMode ? Colors.white : Colors.black, // Adjust icon color based on theme
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          onChanged(!value); // Toggle dark mode on tap
        },
        child: Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode ? Colors.grey[700] : Colors.grey[300], // Background color for toggle
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black : Colors.white, // Circle color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      value ? "ON" : "OFF",
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
    );
  }

  // Custom toggle button for language change
  Widget _buildCustomLanguageToggle(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(
        Icons.language_outlined,
        size: 28,
        color: isDarkMode ? Colors.white : Colors.black, // Adjust icon color based on theme
      ),
      title: Text(
        'Language',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            _isEnglish = !_isEnglish;
          });
        },
        child: Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode ? Colors.grey[700] : Colors.grey[300], // Background color for toggle
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: _isEnglish ? Alignment.centerLeft : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.black : Colors.white, // Circle color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      _isEnglish ? "EN" : "FR",
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}
