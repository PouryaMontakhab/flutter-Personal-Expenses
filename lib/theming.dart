import 'package:flutter/material.dart';

class CustomTheme {
  static TextStyle titleMediumStyling() {
    return TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 19,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle titleSmallStyling() {
    return TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  static AppBarTheme appBarStyling() {
    return AppBarTheme(
        titleTextStyle: TextStyle(
            fontFamily: 'QuickSand', fontSize: 25, fontWeight: FontWeight.bold));
  }
}
