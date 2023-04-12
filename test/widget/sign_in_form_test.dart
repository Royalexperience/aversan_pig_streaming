import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/utils/helper_test.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:aversan_pig_streaming/widgets/password_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aversan_pig_streaming/screens/sign_in.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock {}

Future<void> main() async {
  SignInForm mockSignInForm = SignInForm();
  group('Sign In Form tests', () {
    testWidgets('Test #1: Find the widgets of the form by text', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignInForm));
      await tester.pump();
      // Asserzioni per verificare se il widget è stato correttamente renderizzato
      expect(find.text(EMAIL_ITALIAN), findsOneWidget);
      expect(find.text(PASSWORD_ITALIAN), findsOneWidget);
      expect(find.text(SIGN_IN_TEXT_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #2: Email and password is empty, does not sign in', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignInForm));
      await tester.pump();
      // Premi il bottone
      await tester.tap(find.text(SIGN_IN_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se ci sono due messaggi di errore
      expect(find.text(THIS_FIELD_IS_COMPULSORY_ITALIAN), findsNWidgets(2));
    });
    testWidgets('Test #3: Email or password is empty, does not sign in', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignInForm));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Inserisci del testo nel campo email
      await tester.enterText(find.byType(EmailTextField), 'vincenzo@gmail.com');
      // Premi il bottone
      await tester.tap(find.text(SIGN_IN_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se c'è un messaggio di errore
      expect(find.text(THIS_FIELD_IS_COMPULSORY_ITALIAN), findsOneWidget);
    });
    testWidgets('Test #4: Non empty email and password, sign in', (WidgetTester tester) async {
      // Costruisce il widget in un ambiente virtuale
      await tester.pumpWidget(HelperTest.buildMaterialTestableWidget(mockSignInForm));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Inserisci del testo nel campo email e nel campo password
      await tester.enterText(find.byType(EmailTextField), 'vincenzo@gmail.com');
      await tester.enterText(find.byType(PasswordTextField), 'mock');
      // Premi il bottone
      await tester.tap(find.text(SIGN_IN_TEXT_ITALIAN));
      // Ricostruisci il widget in un ambiente virtuale
      await tester.pump();
      // Verifica se c'è un messaggio di avvenuto login
      expect(find.text("Processing Data"), findsOneWidget);
    });
  });
}