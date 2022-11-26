// Widget test for the MainAppBar look and feel and behavior.
// Written by Vincenzo Iannucci on 26/11/2022

import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Utility functions
double appBarHeight(WidgetTester tester) => tester.getSize(find.byType(AppBar)).height;
double appBarTop(WidgetTester tester) => tester.getTopLeft(find.byType(AppBar)).dy;

/*
 * Define a test. The TestWidgets function also provides a WidgetTesterto work with. 
 * The WidgetTester allows you to build and interact with widgets in the test environment.
*/
Future<void> main() async {
  const actualAppBarBackgroundColor = Colors.blue;
  const actualThemeColor = Colors.red;
  Widget testWidget = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: const MainAppBar(actualAppBarBackgroundColor, actualThemeColor, textTitle: Text("Title name"),))
  );
  testWidgets('MyWidget has a title and message', (tester) async {
    // Build the widget
    await tester.pumpWidget(testWidget);

    // Find a widget that displays the text "Title name"
    final titleFinder = find.text("Title name");
    // Get the height of the MainAppBar and check if the height is the default height
    final actualMainAppBarHeight = appBarHeight(tester);
    // Get the top coordinate of the MainAppBar widget
    final actualMainAppBarTop = appBarTop(tester);

    // Tests
    expect(titleFinder, findsOneWidget);
    expect(actualMainAppBarHeight, DEFAULT_MAIN_APP_BAR_HEIGHT * 10);
    expect(actualMainAppBarTop, 0.0);
  });
}
