// This class provides some useful methods for building effective tests
import 'dart:math';
import 'package:flutter/material.dart';

class HelperTest {
  // Method for building a testable widget that does not need to be wrapped in a Material widget
  static Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(), 
      child: MaterialApp(home: widget)
    );
  }
  // Method for building a testable widget that need to be wrapped in a Material widget
  static Widget buildMaterialTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(), 
      child: MaterialApp(home: 
      Scaffold(
        body: widget
      )
      )
    );
  }
  // Generating a random string with a specific length
  static String getRandomText(int length) {
    const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))
      )
    );
  }
}