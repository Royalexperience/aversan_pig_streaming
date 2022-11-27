// Widget test for the CustomTextField widget look and feel and behavior.
// Written by Vincenzo Iannucci on 27/11/2022

import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  // Mock parameters for the widget
  const String mockHelperText = 'Mock';
  const Color mockHelperTextColor = Colors.black;
  const Color mockFocusBorderColor = Colors.red;
  const double mockFocusBorderWidth = 2;
  // Create the widget test using the mock parameters
  Widget customTextFieldTestWidget = const CustomTextField(
    mockHelperText, 
    mockHelperTextColor, 
    mockFocusBorderColor, 
    mockFocusBorderWidth, 
  );
  testWidgets('CustomTextField test #1: Entering text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(customTextFieldTestWidget));
    // Enter 'hi' into the TextField
    await tester.enterText(find.byType(TextField), 'hi');
    // Rebuild the widget with the new item
    await tester.pump();
    // Expect to find the item on screen
    expect(find.text('hi'), findsOneWidget);
  });
  testWidgets('CustomTextField test #1: Entering a lot of text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(customTextFieldTestWidget));
    // Enter 'hi' into the TextField
    final String randomString = HelperTest.getRandomText(800);
    await tester.enterText(find.byType(TextField), randomString);
    // Rebuild the widget with the new item
    await tester.pump();
    // Expect to find the item on screen
    expect(find.text(randomString), findsOneWidget);
  });
}
