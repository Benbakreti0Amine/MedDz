import 'package:flutter/material.dart';
import 'package:happy_tech_mastering_api_with_flutter/static/colors.dart';

class AppTheme {
  // Define the theme for the application
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: 'LeagueSpartan',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'LeagueSpartan'),
        displayMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        displaySmall: TextStyle(fontFamily: 'LeagueSpartan'),
        headlineLarge: TextStyle(fontFamily: 'LeagueSpartan'),
        headlineMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        headlineSmall: TextStyle(fontFamily: 'LeagueSpartan'),
        titleLarge: TextStyle(fontFamily: 'LeagueSpartan'),
        titleMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        titleSmall: TextStyle(fontFamily: 'LeagueSpartan'),
        bodyLarge: TextStyle(fontFamily: 'LeagueSpartan'),
        bodyMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        bodySmall: TextStyle(fontFamily: 'LeagueSpartan'),
        labelLarge: TextStyle(fontFamily: 'LeagueSpartan'),
        labelMedium: TextStyle(fontFamily: 'LeagueSpartan'),
        labelSmall: TextStyle(fontFamily: 'LeagueSpartan'),
      ),
      // You can define additional theme properties here
    );
  }
}
