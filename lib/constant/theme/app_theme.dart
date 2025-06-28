import 'package:flutter/material.dart';

import '../colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.purpleAccent,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
    ),
    useMaterial3: true,
    brightness: Brightness.light,

    // Define the default font family and text theme
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
      bodySmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      headlineLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      headlineSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      labelLarge:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: darkGrey),
      labelMedium:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: darkGrey),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnClr,
        disabledBackgroundColor: btnClr.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    //AppBar
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
    ),

    // Input Decoration Theme
    // This is used in the textfield for the input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      isDense: false,
      fillColor: Colors.white,
      filled: true,
      errorStyle: TextStyle(
        fontSize: 14,
        color: Colors.red,
        fontFamily: 'Roboto',
      ),
      hintStyle: TextStyle( 
        fontSize: 14,
        color: textFieldHintClr,
        fontFamily: 'Roboto',
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(8)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderClr),
          borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderClr),
          borderRadius: BorderRadius.circular(8)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: borderClr),
          borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderClr),
          borderRadius: BorderRadius.circular(8)),
    ),
  );
  static ThemeData darkTheme=ThemeData(

  );
}
