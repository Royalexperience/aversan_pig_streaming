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
        fontSize: 15.0,
        fontFamily: 'Coolvetica',
      ),
      labelStyle: TextStyle(color: GREY,),
      floatingLabelStyle: TextStyle(
        color: MAIN_BLACK,
        fontWeight: FontWeight.w500,
      ),
    ),
    scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
    fontFamily: 'Coolvetica',
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(MAIN_PINK)), 
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MAIN_PINK),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    ),
    focusColor: MAIN_PINK,
  );
}