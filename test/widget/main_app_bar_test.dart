// Test del widget per l'aspetto e il comportamento del widget Main AppBar.

import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Utility functions
double appBarHeight(WidgetTester tester) => tester.getSize(find.byType(MainAppBar)).height;
double appBarTop(WidgetTester tester) => tester.getTopLeft(find.byType(MainAppBar)).dy;

/*
 * La funzione TestWidgets fornisce anche un WidgetTester con cui lavorare.
 * Il WidgetTester ti consente di creare e interagire con i widget nell'ambiente di test.
*/
Future<void> main() async {
  const mockAppBarBackgroundColor = Colors.blue;
  const mockThemeColor = Colors.red;
  // Crea i widget che devono essere testati
  // MainAppBar con titolo e sfondo
  Widget mainAppBarTitleTestWidget = const MainAppBar(mockAppBarBackgroundColor, mockThemeColor, textTitle: Text("Title name"),);
  // MainAppBar senza titolo e sfondo
  Widget mainAppBarNoTitleTestWidget = const MainAppBar(mockAppBarBackgroundColor, mockThemeColor,);
  testWidgets('Test #1: Find title and positioning', (tester) async {
    // Costruisci il widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarTitleTestWidget));
    // Trova un widget che mostri il testo "Title name"
    final titleFinder = find.text("Title name");
    expect(titleFinder, findsOneWidget);
    // Ottieni la coordinata superiore del widget MainAppBar
    final actualMainAppBarTop = appBarTop(tester);
    expect(actualMainAppBarTop, 0.0);
  });
  testWidgets('Test #2: Scroll up and down', (tester) async {
    // Costruisci il widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarTitleTestWidget));

    // Altezza e posizionamento iniziali della Main AppBar
    final double initalMainAppBarHeight = appBarHeight(tester);
    final double initalMainAppBarTop = appBarTop(tester);

    // Scorri verso il basso fino a quando la parte superiore di MainAppBar diventa invisibile
    await tester.drag(find.byType(MainAppBar), Offset(0.0, initalMainAppBarHeight));
    // Ricostruisci il widget
    await tester.pump();
    // Verifica se MainAppBar è ancora visibile nonostante lo scorrimento
    expect(find.text("Title name"), findsOneWidget);
    expect(appBarHeight(tester), initalMainAppBarHeight);
    expect(appBarTop(tester), initalMainAppBarTop);

    // Scorri verso l'alto fino a quando la parte superiore di MainAppBar diventa invisibile
    await tester.drag(find.byType(MainAppBar), Offset(0.0, -initalMainAppBarHeight));
    // Ricostruisci il widget
    await tester.pump();
    // Verifica se MainAppBar è ancora visibile nonostante lo scorrimento
    expect(find.text("Title name"), findsOneWidget);
    expect(appBarHeight(tester), initalMainAppBarHeight);
    expect(appBarTop(tester), initalMainAppBarTop);
  });
  testWidgets('Test #3: No title and positioning', (tester) async {
    // Costruisci il widget
    await tester.pumpWidget(HelperTest.buildTestableWidget(mainAppBarNoTitleTestWidget));
    // Trova un widget che mostri il testo "Title name"
    final titleFinder = find.text("Title name");
    expect(titleFinder, findsNothing);
    // Ottieni la coordinata superiore del widget MainAppBar
    final actualMainAppBarTop = appBarTop(tester);
    expect(actualMainAppBarTop, 0.0);
  });
}