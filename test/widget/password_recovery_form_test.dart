import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/screens/password_recovery.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock {}

Future<void> main() async {
  PasswordRecoveryForm mockPwdRecoveryForm = PasswordRecoveryForm();

  group('PasswordRecoveryForm tests', () {
    testWidgets('Test #1: Find the widgets of the form by text', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockPwdRecoveryForm));
      await tester.pump();
      // Asserzioni per verificare se il widget è stato correttamente renderizzato
      expect(find.text(EMAIL_ITALIAN), findsOneWidget);
      expect(find.text(SEND_TEXT_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #2: Email is empty, password cannot be recovered', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockPwdRecoveryForm));
      await tester.pump();
      // Premi il bottone
      await tester.tap(find.text(SEND_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se ci sono due messaggi di errore
      expect(find.text(THIS_FIELD_IS_COMPULSORY_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #2: Email is not empty, password can be recovered', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockPwdRecoveryForm));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Inserisci del testo nel campo email e nel campo password
      await tester.enterText(find.byType(EmailTextField), 'vincenzo@gmail.com');
      // Premi il bottone
      await tester.tap(find.text(SEND_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se c'è un messaggio di avvenuto login
      expect(find.text("Recovering password..."), findsOneWidget);
    });
  });
}