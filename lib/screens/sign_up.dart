import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
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
                // Text field dell'email
                CustomTextFieldWithIcon(
                    EMAIL, 
                    GREY, 
                    MAIN_PINK, 
                    2, 
                    EMAIL_ICON, 
                    MAIN_BLACK
                ),
                // Text field dell'username
                CustomTextFieldWithIcon(
                    USERNAME, 
                    GREY, 
                    MAIN_PINK, 
                    2,
                    ACCOUNT_CIRCLE_ICON, 
                    MAIN_BLACK
                ),
                // Text field della password
                CustomTextFieldWithIcon(
                    PASSWORD,
                    GREY,
                    MAIN_PINK,
                    2,
                    obscureTextFlag: true,
                    LOCK_OUTLINED_ICON,
                    MAIN_BLACK
                ),
                // Text field del conferma password
                CustomTextFieldWithIcon(
                    CONFIRM_PASSWORD_ITALIAN,
                    GREY,
                    MAIN_PINK,
                    2,
                    obscureTextFlag: true,
                    LOCK_ICON,
                    MAIN_BLACK
                ),
                // Bottone di invio modulo
                Container(
                  margin: EdgeInsets.only(
                      top: screenHeightPercentage(context, percentage: 0.015)
                  ),
                  child: RoundedButton(
                      SIGN_UP_TEXT_ITALIAN, 
                      () {}, 
                      MAIN_PINK, 
                      WHITE
                  ),
                ),
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