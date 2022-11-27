// Widget test for the MainAppBar widget look and feel and behavior.
// Written by Vincenzo Iannucci on 26/11/2022

import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Utility functions
double appBarHeight(WidgetTester tester) => tester.getSize(find.byType(MainAppBar)).height;
double appBarTop(WidgetTester tester) => tester.getTopLeft(find.byType(MainAppBar)).dy;

/*
 * Define a test. The TestWidgets function also provides a WidgetTester to work with. 
 * The WidgetTester allows you to build and interact with widgets in the test environment.
*/
Future<void> main() async {
  const mockAppBarBackgroundColor = Colors.blue;
  const mockThemeColor = Colors.red;
  // Create the widgets that has to be tested
  // MainAppBar with title and background
  Widget mainAppBarTitleTestWidget = const MainAppBar(mockAppBarBackgroundColor, mockThemeColor, textTitle: Text("Title name"),);
  // MainAppBar without title and background
  Widget mainAppBarNoTitleTestWidget = const MainAppBar(mockAppBarBackgroundColor, mockThemeColor,);
  testWidgets('MainAppBar test #1: Find title and positioning', (tester) async {
    // Build the widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarTitleTestWidget));
    // Find a widget that displays the text "Title name"
    final titleFinder = find.text("Title name");
    expect(titleFinder, findsOneWidget);
    // Get the top coordinate of the MainAppBar widget
    final actualMainAppBarTop = appBarTop(tester);
    expect(actualMainAppBarTop, 0.0);
  });
  testWidgets('MainAppBar test #2: Scroll up and down', (tester) async {
    // Build the widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarTitleTestWidget));

    // Inital MainAppBar height and positioning
    final double initalMainAppBarHeight = appBarHeight(tester);
    final double initalMainAppBarTop = appBarTop(tester);

    // Scroll down until the top of the MainAppBar becomes invisible
    await tester.drag(find.byType(MainAppBar), Offset(0.0, initalMainAppBarHeight));
    // Rebuild the widget
    await tester.pump();
    // Test if the MainAppBar still visible despite the scroll
    expect(find.text("Title name"), findsOneWidget);
    expect(appBarHeight(tester), initalMainAppBarHeight);
    expect(appBarTop(tester), initalMainAppBarTop);

    // Scroll up until the top of the MainAppBar becomes invisible
    await tester.drag(find.byType(MainAppBar), Offset(0.0, -initalMainAppBarHeight));
    // Rebuild the widget
    await tester.pump();
    // Test if the MainAppBar still visible despite the scroll
    expect(find.text("Title name"), findsOneWidget);
    expect(appBarHeight(tester), initalMainAppBarHeight);
    expect(appBarTop(tester), initalMainAppBarTop);
  });
  testWidgets('MainAppBar test #3: No title and positioning', (tester) async {
    // Build the widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarNoTitleTestWidget));
    // Find a widget that displays the text "Title name"
    final titleFinder = find.text("Title name");
    expect(titleFinder, findsNothing);
    // Get the top coordinate of the MainAppBar widget
    final actualMainAppBarTop = appBarTop(tester);
    expect(actualMainAppBarTop, 0.0);
  });
}
