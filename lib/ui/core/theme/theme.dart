import 'dart:ui';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

final class AppColors {
  static final black = Color(0xFF242424);
  static final white = Color(0xFFf2f2f2);
  static final primary = Color(0xFF077d71);
  static final secondary = Color(0xFF3ec7b9);
  static final tertiary = Color(0xFF054d45);
  static final error = Color(0xFFcc3939);

  static final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.secondary,
    surface: AppColors.white,
    onSurface: AppColors.white,
    error: AppColors.white,
    onError: AppColors.error,
  );

  static final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.secondary,
    surface: AppColors.black,
    onSurface: AppColors.black,
    error: AppColors.black,
    onError: AppColors.error,
  );
}

abstract final class AppTheme {
  static final _textTheme = TextTheme(
    titleLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w800,
      fontSize: 25,
      color: AppColors.black,
    ),
    titleMedium: TextStyle(),
    titleSmall: TextStyle(),
    labelLarge: TextStyle(),
    labelMedium: TextStyle(),
    labelSmall: TextStyle(),
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
  );
  static final _textInputTheme = InputDecorationTheme(
    border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black)),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 1.3),
    ),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black)),

    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.error)),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.error, width: 1.3),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _textInputTheme
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    inputDecorationTheme: _textInputTheme
  );
}
