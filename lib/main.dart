import 'package:aversan_pig_streaming/screens/login.dart';
import 'package:aversan_pig_streaming/themes/customColors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _defaultTheme(),
      home: LoginPage(),
    );
  }
}

ThemeData _defaultTheme() {
  return ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    )
  );
}
