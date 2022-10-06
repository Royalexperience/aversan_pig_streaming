import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/screens/sign_up.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: WHITE, //change your color here
        ),
      ),
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IMAGE_PIG_HD_2_PATH),
                CustomTextFieldWithIcon(
                    EMAIL, GREY, MAIN_PINK, 2, Icons.email, MAIN_BLACK),
                CustomTextFieldWithIcon(
                    PASSWORD,
                    GREY,
                    MAIN_PINK,
                    2,
                    obscureTextFlag: true,
                    Icons.lock_outlined,
                    MAIN_BLACK),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: RoundedButton(
                      SIGN_IN_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
                ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
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
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }
}