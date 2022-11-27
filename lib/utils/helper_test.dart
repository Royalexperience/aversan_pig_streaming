import 'package:flutter/material.dart';

class HelperTest {
  static Widget buildTestableWidget(Widget widget) {
    return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
  }
}