import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData mainTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
      selectionColor: primaryColor,
    ),
    primaryColor: primaryColor,
    accentColor: darkColor,
    scaffoldBackgroundColor: mainBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: mainBackgroundColor,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
    backgroundColor: mainBackgroundColor,
  );

  static Color primaryColor = Color(0xff8B82FF);
  static Color darkColor = Color(0xff5655cb);
  static Color mainBackgroundColor = Colors.white;

}