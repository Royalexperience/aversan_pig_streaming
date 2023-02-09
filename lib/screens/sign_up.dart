import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:aversan_pig_streaming/screens/sign_in.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/image_picker_button.dart';
import 'image_pick_screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(COLOR_TRANSPARENT, WHITE),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bottone per selezionare l'immagine avatar
                ImagePickerButton(ImagePickScreen()),
                // Form di registrazione
                SignUpForm(),
                // Pulsante "Hai già un account?"
                Container(
                  margin: EdgeInsets.only(
                      top: screenHeightPercentage(context, percentage: 0.04)),
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      ALREADY_ACCOUNT_ITALIAN,
                      style: TextStyle(fontSize: FONT_SIZE_MID, color: WHITE),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()
                        ),
                      );
                    },
                  ),
                ),
                // Padding per evitare che la tastiera copra la UI
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewInsets.bottom
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Crea il widget del form di accesso
class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Crea una classe State corrispondente. 
// Questa classe contiene i dati relativi al modulo.
class SignUpFormState extends State<SignUpForm> {
  // Crea una chiave globale che identifichi in modo univoco il widget Modulo
  // e consente la validazione del form.
  final _formKey = GlobalKey<FormState>();

  void _validateForm() {
    // Validate restituisce true se il form è valido, false in caso contrario.
    if (_formKey.currentState!.validate()) {
      // Se il modulo è valido, visualizza uno snackbar. Nel mondo reale,
      // chiameresti spesso un server o salveresti le informazioni in un database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Costruisci un widget Modulo utilizzando _formKey creato sopra.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Text field dell'email
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: EmailTextFormFieldWithIcon(EMAIL, GREY, MAIN_PINK, 2, Icons.email, MAIN_BLACK),
          ),
          // Text field dell'username
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: CustomTextFieldWithIcon(USERNAME, GREY, MAIN_PINK, 2, ACCOUNT_CIRCLE_ICON, MAIN_BLACK),
          ),
          // Text field della password
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: CustomTextFieldWithIcon(PASSWORD, GREY, MAIN_PINK, 2, obscureTextFlag: true, LOCK_OUTLINED_ICON, MAIN_BLACK),
          ),
          // Text field del conferma password
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: CustomTextFieldWithIcon(CONFIRM_PASSWORD_ITALIAN, GREY, MAIN_PINK, 2, obscureTextFlag: true, LOCK_ICON, MAIN_BLACK),
          ),
          // Bottone di invio modulo
          Container(
            margin: EdgeInsets.only(top: marginSmall(context)),
            child: RoundedButton(SIGN_UP_TEXT_ITALIAN, _validateForm, MAIN_PINK, WHITE),
          ),
        ],
      ),
    );
  }
}