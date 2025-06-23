import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    const primaryColor = Colors.teal;

    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      fontFamily: 'Roboto',
      brightness: Brightness.dark,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.15),
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        errorStyle: const TextStyle(color: Colors.yellowAccent),
      ),

      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        actionsIconTheme: IconThemeData(color: Colors.white, size: 28),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      listTileTheme: ListTileThemeData(
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryColor,
          fontSize: 16,
        ),
        subtitleTextStyle: TextStyle(color: Colors.grey[700]),
        iconColor: Colors.grey[600],
      ),
    );
  }
}
