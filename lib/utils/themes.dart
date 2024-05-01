import 'package:flutter/material.dart';
import 'constants.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    hintColor: Colors.grey[800],
    fontFamily: Constants.fontRegular,
    scaffoldBackgroundColor: Colors.black,
    cardTheme: CardTheme(
      color: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadius),
        side: const BorderSide(color: Colors.pink),
      ),
    ),
    colorScheme: const ColorScheme(

      background: Colors.black,
      onBackground: Colors.white,
      primary: Colors.blueGrey,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
      brightness: Brightness.dark,
    ),
  );
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    hintColor: Colors.grey[500],
    fontFamily: Constants.fontRegular,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadius),
        side: const BorderSide(color: Colors.pink),
      ),
    ),
    colorScheme: const ColorScheme(
      background: Colors.white,
      onBackground: Colors.black,
      primary: Colors.blueGrey,
      onPrimary: Colors.black,
      secondary: Colors.orange,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      surface: Colors.grey,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
  );
}
