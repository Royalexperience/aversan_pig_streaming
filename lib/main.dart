import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/screens/home.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';
import 'api/api.dart';

void main() {
  API.readEnvFile();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APPLICATION_NAME,
      debugShowCheckedModeBanner: false,
      theme: _darkTheme(),
      home: HomePage(),
      onGenerateRoute: APSNamedRoute.controller,
    );
  }
}

ThemeData _darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
    fontFamily: 'Coolvetica',
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(MAIN_PINK)), 
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MAIN_PINK),
    /*
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    )*/
  );
}
