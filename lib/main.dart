import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/screens/home.dart';
import 'package:aversan_pig_streaming/utils/themes/theme.dart';
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
      theme: APSAppTheme.darkThemeData,
      home: HomePage(),
      onGenerateRoute: APSNamedRoute.controller,
    );
  }
}

