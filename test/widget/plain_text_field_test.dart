import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/widgets/plain_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';

Future<void> main() async {
  // Valori fittizzi
  var textController = TextEditingController();
  var mockIcon = Icon(Icons.access_time, color: MAIN_BLACK);
  const hintText = 'Hello, world!';

  // PlainTextField senza helper text
  var plainTextFieldTestWidgetNoHint = PlainTextField(hintText: '', controller: textController,);
  // PlainTextField con helper text
  var plainTextFieldTestWidgetHint = PlainTextField(hintText: hintText, controller: textController,);
  // PlainTextField con icona
  var plainTextFieldTestWidgetIcon = PlainTextField(hintText: hintText, controller: textController, prefixIcon: mockIcon,);

  group('PlainTextField basic tests', () {
    testWidgets('Test #1: Renders correctly', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetNoHint));
      // Asserzione per verificare se il widget è stato correttamente renderizzato
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Test #2: Displays hint text', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetHint));
      // Asserzione per verificare se il widget è stato correttamente renderizzato
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      // Asserzione per verificare se l'hint text si trova nel widget
      expect((tester.widget(textField) as TextField).decoration?.hintText, hintText);
    });
    testWidgets('Test #3: Dispays prefix icon', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetIcon));
      // Asserzione per verificare se il widget è stato correttamente renderizzato
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      // Asserzione per verificare se l'icona si trova nel widget
      expect((tester.widget(textField) as TextField).decoration?.prefixIcon, mockIcon);
    });

    testWidgets('Test #4: Updates value on input', (WidgetTester tester) async {
      final updatedValue = HelperTest.getRandomText(200);
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetHint));
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      // Inserisci del testo nel widget
      await tester.enterText(textField, updatedValue);
      // Verifica se il testo è stato correttamente inserito
      expect((tester.widget(textField) as TextField).controller?.text, updatedValue);
    });
  });
}
