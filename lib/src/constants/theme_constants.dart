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

class AppColors {
  static const lightPurple = Color.fromARGB(255, 171, 129, 255);
  static const lightBlack = Color(0xff1D2A30);
  static const darkPurple = Color(0xff2F2762);
  static const black = Colors.black;
  static const white = Colors.white;
}

TextStyle customTextStyle({
  required final double fontSize,
  final Color? color,
  final FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
