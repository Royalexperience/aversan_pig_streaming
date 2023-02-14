import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/main_app_bar.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(COLOR_TRANSPARENT, WHITE),
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Immagine del puorchetiello
                Image.asset(IMAGE_PIG_HD_2_PATH),
                // Form di login
                SignInForm(),
                // Parte sotto al form di login che comprende le chiamate al form di registrazione
                // e al form di recupero password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35, bottom: 35),
                      child: InkWell(
                        child: Text(
                          NO_ACCOUNT_ITALIAN,
                          style: TextStyle(fontSize: FONT_SIZE_MID, color: WHITE),
                        ),
                        onTap: () {
                          // Rimanda alla pagina di registrazione
                          Navigator.pushNamed(context, APSNamedRoute.signUpPage,);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35, bottom: 35),
                      child: InkWell(
                        child: Text(
                          FORGOT_PASSWORD_ITALIAN,
                          style: TextStyle(fontSize: FONT_SIZE_MID, color: WHITE),
                        ),
                        onTap: () {
                          // Rimanda alla schermata di recupero password
                          Navigator.pushNamed(context, APSNamedRoute.forgotPasswordPage);
                        },
                      ),
                    ),
                  ],
                ),
                // Padding per evitare che la tastiera copra la UI
                Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.bottom)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Crea il widget del form di accesso
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

// Crea una classe State corrispondente. 
// Questa classe contiene i dati relativi al modulo.
class SignInFormState extends State<SignInForm> {
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
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: EmailTextFormFieldWithIcon(EMAIL, GREY, MAIN_PINK, 2, Icons.email, MAIN_BLACK),
          ),
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: CustomTextFieldWithIcon(PASSWORD, GREY, MAIN_PINK, 2, obscureTextFlag: true, Icons.lock_outlined, MAIN_BLACK),
          ),
          Container(
            margin: EdgeInsets.only(top: marginSmall(context)),
            child: RoundedButton(SIGN_IN_TEXT_ITALIAN, _validateForm, MAIN_PINK, WHITE),
          ),
        ],
      ),
    );
  }
}