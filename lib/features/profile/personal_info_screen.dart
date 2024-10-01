import 'package:flutter/material.dart';
// Import provider to access AppTheme
// Import AppTheme

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Retrieve the active theme
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal info',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 26, // Increased font size for the title
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title
        backgroundColor: isDarkMode ? Colors.black : Colors.white, // Set AppBar background color to match theme
        elevation: 0, // Remove AppBar shadow
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black, // Set the icon color according to theme
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // Set screen background to match theme
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60, // Increased avatar size for a beautiful look
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: isDarkMode ? Colors.white : Colors.black, // Adjust color for theme
                            size: 28, // Increased size of the camera icon
                          ),
                          onPressed: () {
                            // Handle image update
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Full Name Field
                Text(
                  'Enter your full name:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontSize: 18, // Increased label text size
                      color: isDarkMode ? Colors.white : Colors.black, // Adjust label color
                    ),
                    hintText: 'Thanh Nhan',
                    hintStyle: const TextStyle(fontSize: 16),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.black : Colors.white, // Adjust field background color
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black, // Adjust input text color
                  ),
                ),
                const SizedBox(height: 16),

                // Email Field
                Text(
                  'Enter your email:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 18, // Increased label text size
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    hintText: 'nhập tên đăng nhập',
                    hintStyle: const TextStyle(fontSize: 16),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.black : Colors.white,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Password Field
                Text(
                  'Enter your password:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 18, // Increased label text size
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.black : Colors.white,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                // Repeat Password Field
                Text(
                  'Repeat your password:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: isDarkMode ? Colors.black : Colors.white,
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
