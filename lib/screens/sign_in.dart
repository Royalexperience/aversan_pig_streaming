import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/widgets/button_only_text.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:aversan_pig_streaming/widgets/password_text_field.dart';
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
                    // Rimanda alla pagina di registrazione
                    ButtonOnlyText(NO_ACCOUNT_ITALIAN, onPress: () {
                      Navigator.pushNamed(context, APSNamedRoute.signUpPage,);
                    },),
                    // Rimanda alla schermata di recupero password
                    ButtonOnlyText(FORGOT_PASSWORD_ITALIAN, onPress: () {
                      Navigator.pushNamed(context, APSNamedRoute.forgotPasswordPage);
                    }),
                  ],
                ),
                // Padding per evitare che la tastiera copra la UI
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.bottom
                  )
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
            child: EmailTextField(hintText: EMAIL_ITALIAN, controller: _emailController, prefixIconFlag: true,),
          ),
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: PasswordTextField(hintText: PASSWORD_ITALIAN, controller: _passController, prefixIconFlag: true,),
          ),
          Container(
            margin: EdgeInsets.only(top: marginSmall(context)),
            child: RoundedButton(SIGN_IN_TEXT_ITALIAN, _validateForm,),
          ),
        ],
      ),
    );
  }
}