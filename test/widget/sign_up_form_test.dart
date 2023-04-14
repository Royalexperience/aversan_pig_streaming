import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/confirm_password_text_field.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:aversan_pig_streaming/widgets/password_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/screens/sign_up.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock {}

Future<void> main() async {
  SignUpForm mockSignUpForm = SignUpForm();
  group('Sign In Form tests', () {
    testWidgets('Test #1: Find the widgets of the form by text', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignUpForm));
      await tester.pump();
      // Asserzioni per verificare se il widget è stato correttamente renderizzato
      expect(find.text(EMAIL_ITALIAN), findsOneWidget);
      expect(find.text(USERNAME_ITALIAN), findsOneWidget);
      expect(find.text(PASSWORD_ITALIAN), findsOneWidget);
      expect(find.text(CONFIRM_PASSWORD_ITALIAN), findsOneWidget);
      expect(find.text(SIGN_UP_TEXT_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #2: All fields are empty', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignUpForm));
      await tester.pump();
      // Premi il bottone
      await tester.tap(find.text(SIGN_UP_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se ci sono due messaggi di errore
      expect(find.text(THIS_FIELD_IS_COMPULSORY_ITALIAN), findsNWidgets(4));
    });
    testWidgets('Test #3: Incorrect email', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignUpForm));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Inserisci del testo nel campo email e nel campo password
      await tester.enterText(find.byType(EmailTextField), 'vincenzo');
      // Premi il bottone
      await tester.tap(find.text(SIGN_UP_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se c'è un messaggio di avvenuto login
      expect(find.text(TYPE_A_VALID_EMAIL_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #4: Passwords does not match', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignUpForm));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Inserisci del testo nel campo email e nel campo password
      await tester.enterText(find.byType(PasswordTextField), 'mock');
      await tester.enterText(find.byType(ConfirmPasswordTextField), 'ciao');
      // Premi il bottone
      await tester.tap(find.text(SIGN_UP_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se c'è un messaggio di avvenuto login
      expect(find.text(PASSWORDS_DOES_NOT_MATCH_ITALIAN), findsAtLeastNWidgets(1));
    });
  });
}