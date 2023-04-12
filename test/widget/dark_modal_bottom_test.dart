import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/widgets/dark_modal_bottom.dart';

Future<void> main() async {
  String mockTitle = "Mock title";
  String mockMessage = "Mock message";
  var darkModalBottomTest = DarkModalBottom(title: mockTitle, message: mockMessage);
  group('DarkModalBottom tests', () {
     testWidgets('Test #1: Modal BottomSheet builder should only be called once', (WidgetTester tester) async {
      late BuildContext savedContext;
      // Costruisci il context per l'ambiente di test
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            savedContext = context;
            return Container();
          },
        ),
      ));
      // Flag per contare il numero di volte che viene richiamato il modal
      int numBuilderCalls = 0;
      // Richiama il modal
      showModalBottomSheet<void>(
        context: savedContext,
        isDismissible: false,
        builder: (BuildContext context) {
          numBuilderCalls++;
          return darkModalBottomTest;
        },
      );
      // Verifica il numero di chiamate
      await tester.pumpAndSettle();
      expect(numBuilderCalls, 1);
      // Scorri in basso per far scomparire il modal
      await tester.drag(find.text(mockTitle), const Offset(0.0, 150.0));
      // Aspetta che l'animazione chiuda il modal
      await tester.pumpAndSettle(); 
      // Controlla che il numero di chiamate sia ancora pari ad uno
      expect(numBuilderCalls, 1);
    });
    testWidgets('Test #2: Tapping on a modal BottomSheet should not dismiss it', (WidgetTester tester) async {
      late BuildContext savedContext;
      // Costruisci il context per l'ambiente di test
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              savedContext = context;
              return Container();
            },
          ),
        ),
      );
      // Se il modal non è stato ancora chiamato, il mockTitle non deve esistere
      await tester.pump();
      expect(find.text(mockTitle), findsNothing);
      // Flag che verifica se il modal è stato richiamato
      bool showBottomSheetThenCalled = false;
      showModalBottomSheet<void>(
        context: savedContext,
        builder: (BuildContext context) => darkModalBottomTest,
      ).then<void>((void value) {
        showBottomSheetThenCalled = true;
      });
      // Aspetta che l'animazione termini
      await tester.pumpAndSettle();
      // Verifica se il modal è apparso, verificando se il titolo esiste
      expect(find.text(mockTitle), findsOneWidget);
      // Asserzione per verificare se è stato richiamato il modal
      expect(showBottomSheetThenCalled, isFalse);
      // Verifica se il tap sul bordo del modal lo fa chiudere
      await tester.tap(find.text(mockTitle));
      await tester.pumpAndSettle();
      expect(find.text(mockTitle), findsOneWidget);
      expect(showBottomSheetThenCalled, isFalse);
    });

    testWidgets('Test #3: Swiping down a modal BottomSheet should dismiss it by default', (WidgetTester tester) async {
      late BuildContext savedContext;
      // Costruisci il context per l'ambiente di test
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            savedContext = context;
            return Container();
          },
        ),
      ));
      // Se il modal non è stato ancora chiamato, il mockTitle non deve esistere
      await tester.pump();
      expect(find.text(mockTitle), findsNothing);
      // Flag che verifica se il modal è stato richiamato
      bool showBottomSheetThenCalled = false;
      showModalBottomSheet<void>(
        context: savedContext,
        isDismissible: false,
        builder: (BuildContext context) => darkModalBottomTest,
      ).then<void>((void value) {
        showBottomSheetThenCalled = true;
      });
      await tester.pumpAndSettle();
      expect(find.text(mockTitle), findsOneWidget);
      expect(showBottomSheetThenCalled, isFalse);
      // Scorri il foglio inferiore per chiudere il modal
      await tester.drag(find.text(mockTitle), const Offset(0.0, 150.0));
      await tester.pumpAndSettle();
      expect(showBottomSheetThenCalled, isTrue);
      expect(find.text(mockTitle), findsNothing);
    });

  });
}