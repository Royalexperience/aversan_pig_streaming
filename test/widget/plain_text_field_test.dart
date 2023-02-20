import 'package:aversan_pig_streaming/widgets/plain_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';

Future<void> main() async {
  var textController = TextEditingController();
  const hintText = 'Hello, world!';
  Widget plainTextFieldTestWidgetNoHint = PlainTextField(hintText: '', controller: textController,);
  Widget plainTextFieldTestWidgetHint = PlainTextField(hintText: hintText, controller: textController,);
  group('PlainTextField basic tests', () {
    testWidgets('Test #1: Renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetNoHint));
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Test #2: Displays hint text', (WidgetTester tester) async {
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetHint));
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      expect((tester.widget(textField) as TextField).decoration?.hintText, hintText);
    });

    testWidgets('Test #3: Updates value on input', (WidgetTester tester) async {
      final updatedValue = HelperTest.getRandomText(200);
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(plainTextFieldTestWidgetHint));
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, updatedValue);
      expect((tester.widget(textField) as TextField).controller?.text, updatedValue);
    });
  });
}
