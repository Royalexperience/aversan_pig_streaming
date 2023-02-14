// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:aversan_pig_streaming/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  Widget testWidget = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: HomePage())
  );

  testWidgets('Login Page smoke test', (WidgetTester tester) async {

  await tester.pumpWidget(testWidget);

  await tester.pumpAndSettle();

  });
}
