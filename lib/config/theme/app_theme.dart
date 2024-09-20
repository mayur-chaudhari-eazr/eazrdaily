import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  // Get the current theme mode
  ThemeMode get themeMode => _themeMode;

  // Toggle between light and dark mode
  void toggleTheme(bool isDarkModeEnabled) {
    _themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners about the change
  }

  // Light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.white,
    ),
  );

  // Dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.black,
      onPrimary: Colors.white,
    ),
  );

  // Define light mode colors
  static const Color lightModeStatusBarColor = Colors.blue;
  static const Color darkModeStatusBarColor = Colors.black;
}