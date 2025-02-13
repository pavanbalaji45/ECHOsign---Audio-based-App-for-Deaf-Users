import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xFF007BFF); // Bright Blue
  static final Color secondaryColor = Color(0xFF00C897); // Mint Green
  static final Color accentColor = Color(0xFFFFA500); // Bright Orange
  static final Color backgroundColor = Color(0xFFF8F9FA); // Light Gray
  static final Color textColor = Color(0xFF343A40); // Dark Gray

  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 1,
      iconTheme: IconThemeData(color: textColor), toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22, fontWeight: FontWeight.bold, color: textColor,
      ),
      ).bodyMedium, titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
      centerTitle: true,
    ),
    // fonts from assets folder
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22, fontWeight: FontWeight.bold, color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16, fontWeight: FontWeight.normal, color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12, fontWeight: FontWeight.w300, color: textColor,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: accentColor,
      surface: backgroundColor,
    ),
  );
}
