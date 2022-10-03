import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/widgets/google_icons_icons.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../widgets/circles_in_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: Circle(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(IMAGE_PIG_HD_2_PATH),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    ALREADY_ACCOUNT_ITALIAN,
                    style: TextStyle(
                      fontSize: FONT_SIZE_MID,
                      color: GREY,
                    ),
                  ),
                ),
                Text(LOGIN,
                    style: TextStyle(
                      color: MAIN_PINK,
                    ))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child:
                  RoundedButton(SIGN_UP_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE)),
          RoundendButtonWithIcon(SIGN_UP_WGOOGLE_ITALIAN, () {}, WHITE, MAIN_BLACK,GoogleIcons.google),
        ],
      ),
    ));
  }
}
