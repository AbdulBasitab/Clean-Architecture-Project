import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff2F2762),
      primary: const Color(0xff1D2A30),
      secondary: const Color.fromARGB(255, 171, 129, 255),
      brightness: Brightness.dark,
    ),
  );
}

TextStyle customTextStyle({
  required final double fontSize,
  required final Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
  );
}
