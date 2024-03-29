import 'package:aversan_pig_streaming/widgets/confirm_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';

Future<void> main() async {
  // Valori fittizzi
  var textController = TextEditingController();
  const hintText = 'Confirm Password';

  // ConfirmPasswordTextField senza helper text
  var confirmPasswordTextFieldTestWidgetNoHint = ConfirmPasswordTextField(hintText: '', confirmPasswordController: textController,);
  // ConfirmPasswordTextField con helper text
  var confirmPasswordTextFieldTestWidgetHint = ConfirmPasswordTextField(hintText: hintText, confirmPasswordController: textController,);

  group('ConfirmPasswordTextField basic tests', () {
    testWidgets('Test #1: Renders correctly', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(confirmPasswordTextFieldTestWidgetNoHint));
      // Asserzione per verificare se il widget è stato correttamente renderizzato
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Test #2: Displays hint text', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(confirmPasswordTextFieldTestWidgetHint));
      // Asserzione per verificare se il widget è stato correttamente renderizzato
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      // Asserzione per verificare se l'hint text si trova nel widget
      expect((tester.widget(textField) as TextField).decoration?.hintText, hintText);
    });
    testWidgets('Test #3: Updates value on input', (WidgetTester tester) async {
      final updatedValue = HelperTest.getRandomText(200);
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(confirmPasswordTextFieldTestWidgetHint));
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      // Inserisci del testo nel widget
      await tester.enterText(textField, updatedValue);
      // Verifica se il testo è stato correttamente inserito
      expect((tester.widget(textField) as TextField).controller?.text, updatedValue);
    });
  });
}