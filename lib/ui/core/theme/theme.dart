import 'dart:ui';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

final class AppColors {
  static final black = Color(0xFF242424);
  static final hint = Color(0xFF929292);
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
    surface: AppColors.white,
    onSurface: AppColors.white,
    error: AppColors.black,
    onError: AppColors.error,
  );
}

abstract final class AppTheme {
  static final _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
    titleMedium: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );


  static final _appBarTheme = AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
  );
  static final _textInputTheme = InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.hint),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 1.3),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.black),
    ),

    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.error, width: 1.3),
    ),
  );

  static final snackBarThemeData = SnackBarThemeData(
    backgroundColor: AppColors.tertiary
  );

  static final bottomAppBarThemeData = BottomAppBarTheme(
    color: AppColors.tertiary,
    surfaceTintColor: AppColors.tertiary
  );
  static final _listTileTheme = ListTileThemeData(
    textColor: AppColors.black,
    tileColor: AppColors.white,
    leadingAndTrailingTextStyle: TextStyle(color: AppColors.black),
    iconColor: AppColors.black


  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: _appBarTheme,
    textTheme: _textTheme,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _textInputTheme,
    snackBarTheme: snackBarThemeData,
    bottomAppBarTheme: bottomAppBarThemeData,
    listTileTheme: _listTileTheme
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: _appBarTheme,
    textTheme: _textTheme,
    colorScheme: AppColors.darkColorScheme,
    inputDecorationTheme: _textInputTheme,
    snackBarTheme: snackBarThemeData,
    bottomAppBarTheme: bottomAppBarThemeData,
    listTileTheme: _listTileTheme
  );

}

