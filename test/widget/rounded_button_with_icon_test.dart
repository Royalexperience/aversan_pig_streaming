import 'package:flutter/material.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';

Future<void> main() async {
  callback (){ const SnackBar(content: Text('Processing Data')); }
  IconData mockIconData = ACCOUNT_CIRCLE_ICON;
  Color mockIconColor = MAIN_BLACK;
  group('RoundendButtonWithIcon basic tests', () {
    // Verificare che i valori predefiniti siano impostati quando non vengono passati argomenti aggiuntivi
    testWidgets('Test #1: RoundendButtonWithIcon with default constructors', (WidgetTester tester) async {
      var basicButton = RoundendButtonWithIcon('Hello World', callback, mockIconData, mockIconColor);
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(basicButton));
      // Asserzioni per verificare se il widget è stato correttamente renderizzato
      expect(basicButton.text, 'Hello World');
      expect(basicButton.press, callback);
      expect(basicButton.color, MAIN_PINK);
      expect(basicButton.textColor, WHITE);
    });
    
    // I valori di test vengono impostati correttamente quando vengono passati argomenti aggiuntivi
    testWidgets('Test #2: RoundendButtonWithIcon with custom constructors', (WidgetTester tester) async {
      var buttonWOtherParameters = RoundendButtonWithIcon('Goodbye World', callback, mockIconData, mockIconColor, color: WHITE, textColor: MAIN_BLACK);
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(buttonWOtherParameters));
      // Asserzioni per verificare se il widget è stato correttamente renderizzato
      expect(buttonWOtherParameters.text, 'Goodbye World');
      expect(buttonWOtherParameters.press, callback);
      expect(buttonWOtherParameters.color, WHITE);
      expect(buttonWOtherParameters.textColor, MAIN_BLACK);
    });
    
    // Il test premendo il pulsante richiama la callback fornita
    testWidgets('Test #3: RoundendButtonWithIcon onPress', (WidgetTester tester) async {
      var pressed = false;
      callback() { pressed = true; }
      final buttonPressed = RoundendButtonWithIcon('Press Me', callback, mockIconData, mockIconColor);
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(buttonPressed));
      buttonPressed.press();
      expect(pressed, true);
    });
  });
}