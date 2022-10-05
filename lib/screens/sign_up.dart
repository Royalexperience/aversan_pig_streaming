import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IMAGE_PIG_HD_2_PATH),
                CustomTextField(EMAIL, GREY, MAIN_PINK, 2),
                CustomTextField(USERNAME, GREY, MAIN_PINK, 2),
                CustomTextField(
                  PASSWORD,
                  GREY,
                  MAIN_PINK,
                  2,
                  obscureTextFlag: true,
                ),
                CustomTextField(
                  CONFIRM_PASSWORD_ITALIAN,
                  GREY,
                  MAIN_PINK,
                  2,
                  obscureTextFlag: true,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: RoundedButton(
                      SIGN_UP_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 35),
                  child: InkWell(
                    child: Text(
                      ALREADY_ACCOUNT_ITALIAN,
                      style: TextStyle(fontSize: FONT_SIZE_MID, color: WHITE),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
