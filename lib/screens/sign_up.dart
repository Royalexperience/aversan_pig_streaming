import 'package:aversan_pig_streaming/constants/response_string.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:aversan_pig_streaming/routes/aps_routes.dart';
import 'package:aversan_pig_streaming/utils/utils.dart';
import 'package:aversan_pig_streaming/widgets/button_only_text.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/confirm_password_text_field.dart';
import 'package:aversan_pig_streaming/widgets/dark_modal_bottom.dart';
import 'package:aversan_pig_streaming/widgets/email_text_field.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:aversan_pig_streaming/widgets/password_text_field.dart';
import 'package:aversan_pig_streaming/widgets/plain_text_field.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:aversan_pig_streaming/api/api.dart';
import 'package:aversan_pig_streaming/api/aps_encrypt.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/widgets/avatar_button_picker.dart';
import 'package:http/http.dart';
import 'package:aversan_pig_streaming/models/user.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                // Bottone per selezionare l'immagine avatar
                AvatarButtonPicker(avatarInfoList: Utils.getUserAvatarList(),),
                // Form di registrazione
                SignUpForm(),
                // Pulsante "Hai già un account?"
                ButtonOnlyText(ALREADY_ACCOUNT_ITALIAN, onPress: () {
                  Navigator.pushNamed(context, APSNamedRoute.signInPage,);
                },),
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  void _handleResponse(Response response) {
    switch (response.statusCode) {
      // Avvenuta registrazione
      case HTTPStatusCode.STATUS_CREATED:
        // Gestisci l'avvenuta registrazione
        if (mounted) {
          Navigator.pushNamed(context, APSNamedRoute.signUpOkPage);
        }
      break;
      // Email già registrata
      case HTTPStatusCode.STATUS_CONFLICT:
        // Mostra il modal di errore
        showModalBottomSheet<void>(
            context: context,
            backgroundColor: COLOR_TRANSPARENT,
            builder: (BuildContext context) {
              return DarkModalBottom(
                title: ALERT_ITALIAN,
                message: EMAIL_ALREADY_TAKEN_ITALIAN,
                button1: RoundedButton(
                    SIGN_IN_TEXT_ITALIAN, 
                    () { Navigator.pushNamed(context, APSNamedRoute.signInPage); }, 
                  ),
                button2: RoundedButton(
                    RECOVER_YOUR_PASSWORD_ITALIAN, 
                    () { Navigator.pushNamed(context, APSNamedRoute.forgotPasswordPage); }, 
                  )
              );
          },
        );
      break;
      // Errore del server
      case HTTPStatusCode.STATUS_INTERNAL_SERVER_ERROR: 
        if (mounted) {
          Navigator.pushNamed(context, APSNamedRoute.error500Screen);
        }
      break;
      // Caso di default
      default:
    }
  }

  Future<void> _register() async {
    // Validate restituisce true se il form è valido, false in caso contrario.
    if (_formKey.currentState!.validate()) {
      // Crea un nuovo oggetto user
      User user = User(_usernameController.text, _emailController.text, APSEncrypt.encrypt(_passController.text));
      // Converti in json
      var data = user.toJson();
      // Richiama il metodo post della classe API per inviare i dati al database
      final response = await API.post(data);
      // Controlla il responso
      _handleResponse(response);
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
            child: EmailTextField(hintText: EMAIL_ITALIAN, controller: _emailController, prefixIconFlag: true,),
          ),
          // Text field dell'username
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: PlainTextField(hintText: USERNAME_ITALIAN, controller: _usernameController, prefixIcon: Icon(ACCOUNT_CIRCLE_ICON, color: MAIN_BLACK,),),
          ),
          // Text field della password
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: PasswordTextField(hintText: PASSWORD_ITALIAN, controller: _passController, prefixIconFlag: true,),
          ),
          // Text field del conferma password
          Container(
            margin: EdgeInsets.only(bottom: marginSmall(context)),
            child: ConfirmPasswordTextField(hintText: CONFIRM_PASSWORD_ITALIAN, confirmPasswordController: _confirmPassController, passwordController: _passController, prefixIconFlag: true,),
          ),
          // Bottone di invio modulo
          Container(
            margin: EdgeInsets.only(top: marginSmall(context)),
            child: RoundedButton(SIGN_UP_TEXT_ITALIAN, _register,),
          ),
        ],
      ),
    );
  }
}