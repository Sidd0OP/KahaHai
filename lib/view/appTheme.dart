import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFFEDF2FB),
      tertiary: Color(0xFF83BCFF),
      error: Color(0xFFF19A3E),

      onSurface: Colors.black
    ),

    textTheme: GoogleFonts.poppinsTextTheme().copyWith(

      headlineLarge: const TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),

      titleLarge: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),

      titleMedium: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),

      titleSmall: const TextStyle(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),

      labelSmall: const TextStyle(
        fontSize: 8,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

extension AppThemeExtension on BuildContext {

  // COLORS
  Color get primary =>
      Theme.of(this).colorScheme.primary;

  Color get secondary =>
      Theme.of(this).colorScheme.secondary;

  Color get tertiary =>
      Theme.of(this).colorScheme.tertiary;

  Color get error =>
      Theme.of(this).colorScheme.error;

  Color get onSurface =>
      Theme.of(this).colorScheme.onSurface;



  // TEXT STYLES
  TextStyle? get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge;

  TextStyle? get titleLarge =>
      Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium =>
      Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall =>
      Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelSmall =>
      Theme.of(this).textTheme.labelSmall;
}