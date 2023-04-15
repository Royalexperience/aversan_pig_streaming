import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/models/headings.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:flutter/material.dart';
import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';


class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});

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
                // Immagine puorchetiello triste
                Image.asset(IMAGE_SAD_PIG_PATH, scale: screenHeightPercentage(context, percentage: 0.0020),),
                // Messaggi per l'utente
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)),
                  child: Center(
                    child: Heading2(context: context, text: PASSWORD_FORGOTTED_ITALIAN, color: GREY,),
                  ),
                ),
                Center(
                  child: Heading3(context: context, text: DONT_WORRY_ITALIAN, color: GREY,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)),
                  child: Center(
                    child: Heading3(context: context, text: TYPE_EMAIL_ITALIAN, color: GREY),
                  ),
                ),
                // Form per scrivere la e-mail
                PasswordRecoveryForm(),
                // Padding per rendere visibile il form
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

class PasswordRecoveryForm extends StatefulWidget {
  const PasswordRecoveryForm({super.key});
  
  @override
  PasswordRecoveryFormState createState() {
    return PasswordRecoveryFormState();
  }
}

class PasswordRecoveryFormState extends State<PasswordRecoveryForm> {
  // Crea una chiave globale che identifichi in modo univoco il widget Modulo
  // e consente la validazione del form.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _validateForm() {
    // Validate restituisce true se il form è valido, false in caso contrario.
    if (_formKey.currentState!.validate()) {
      // Se il modulo è valido, visualizza uno snackbar. Nel mondo reale,
      // chiameresti spesso un server o salveresti le informazioni in un database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recovering password...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Form per scrivere la e-mail
          EmailTextField(hintText: EMAIL_ITALIAN, controller: _emailController, prefixIconFlag: true,),
          // Bottone di invio
          Container(
            margin: EdgeInsets.only(top: marginSmall(context)),
            child: RoundedButton(SEND_TEXT_ITALIAN, _validateForm,),
          ),
        ],
      ),
    );
  }
}