import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/icon1x.png'),
          SizedBox(height: 10),
          Center(
            child: Text(
              APPLICATION_NAME,
              style: TextStyle(
                fontSize: FONT_SIZE_HUGE,
                fontWeight: FontWeight.bold,
                color: WHITE,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
              child: Text(
            DESCRIPTION_LOGIN_PAGE,
            style: TextStyle(
              fontSize: FONT_SIZE_BIG,
              color: GREY,
            ),
          )),
          SizedBox(height: 45),
          Row(
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
                  )
              )
            ],
          ),
          SizedBox(height: 45),
          RoundedButton(SIGN_UP_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
          SizedBox(height: 20),
          RoundedButton(SIGN_UP_WGOOGLE_ITALIAN, () {}, WHITE, MAIN_BLACK),
        ],
      ),
    );
  }
}
