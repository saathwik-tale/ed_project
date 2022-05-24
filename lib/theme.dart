import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color PrimaryClr = const Color.fromRGBO(13, 98, 124, 1);

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.amberAccent,
    brightness: Brightness.light,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromRGBO(13, 98, 124, 1)),
  );

  static final dark = ThemeData(
    primaryColor: Colors.amberAccent,
    brightness: Brightness.dark,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 30, 29, 29)),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]),
  );
}
