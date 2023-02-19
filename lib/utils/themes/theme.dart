import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';

class APSAppTheme {
  static ThemeData get darkThemeData => ThemeData(
    primaryColor: MAIN_PINK,
    primarySwatch: Colors.pink,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: MAIN_PINK),
      ),
      filled: true,
      fillColor: WHITE,
      hintStyle: TextStyle(color: GREY),
      errorStyle: TextStyle(
        fontFamily: FONT_FAMILY_NAME,
      ),
      labelStyle: TextStyle(color: GREY,),
      floatingLabelStyle: TextStyle(
        color: MAIN_BLACK,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MAIN_PINK,
        shadowColor: MAIN_BLACK,
        textStyle: TextStyle(color: WHITE, fontFamily: FONT_FAMILY_NAME),
      ),
    ),
    scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
    fontFamily: FONT_FAMILY_NAME,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(MAIN_PINK)), 
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MAIN_PINK),
    focusColor: MAIN_PINK,
  );
}