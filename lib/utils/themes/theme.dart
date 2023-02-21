import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';

class APSAppTheme {
  static ThemeData get darkThemeData => ThemeData(
    // Colore primario
    primaryColor: MAIN_PINK,
    primarySwatch: Colors.pink,
    // Colore delle icone
    iconTheme: IconThemeData(color: MAIN_BLACK, opacity: 1),
    // Stile dei campi di testo
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
    // Stile dei bottoni
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MAIN_PINK,
        shadowColor: MAIN_BLACK,
        textStyle: TextStyle(color: WHITE, fontFamily: FONT_FAMILY_NAME),
      ),
    ),
    // Colore dello scaffold
    scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
    // Font family del tema
    fontFamily: FONT_FAMILY_NAME,
    // Stile della scrollbar
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(MAIN_PINK)
    ),
    // Schema colori principale
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MAIN_PINK),
    // Colore degli elementi in focus
    focusColor: MAIN_PINK,
  );
}