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
    scaffoldBackgroundColor: mainBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: mainBackgroundColor,
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
    backgroundColor: mainBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkColor),
  );

  static Color primaryColor = Color(0xff8B82FF);
  static Color lightColor = Color(0xffc0b2ff);
  static Color darkColor = Color(0xff5655cb);
  static Color mainBackgroundColor = Colors.white;

  static Color mainTextColor = Colors.grey.shade800;

  static TextStyle montText = TextStyle(
    color: mainTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montTextLight =
      TextStyle(color: Colors.grey.shade400, fontSize: 14);

  static TextStyle montTextLittle =
      TextStyle(color: mainTextColor, fontSize: 14);

  static TextStyle montTextTitle = TextStyle(
    color: mainTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static BorderRadius defaultBorderRadius =
      BorderRadius.all(Radius.circular(12));

  static BorderRadius circularBorderRadius =
      BorderRadius.all(Radius.circular(200));

  static BoxDecoration cardDecoration = BoxDecoration(
    color: mainBackgroundColor,
    borderRadius: defaultBorderRadius,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        offset: Offset(0, 2),
        blurRadius: 2,
      ),
    ],
  );

  static getTextFieldDecorationUnderline(String value) {
    return InputDecoration(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      labelText: value,
      focusColor: primaryColor,
      labelStyle: TextStyle(color: Colors.grey),
    );
  }
}
