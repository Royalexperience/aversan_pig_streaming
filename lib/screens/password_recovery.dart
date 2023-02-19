import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/main_app_bar.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';


class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

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
                Image.asset(IMAGE_SAD_PIG_PATH, scale: screenHeightPercentage(context, percentage: 0.0020),),
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)),
                  child: Center(
                    child: Text(
                      PASSWORD_FORGOTTED_ITALIAN,
                      style: TextStyle(
                        fontSize: fontSizeBig(context),
                        color: GREY,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    DONT_WORRY_ITALIAN,
                    style: TextStyle(
                      fontSize: fontSizeMid(context),
                      color: GREY,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    TYPE_EMAIL_ITALIAN,
                    style: TextStyle(
                      fontSize: fontSizeMid(context),
                      color: GREY,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: marginSmall(context)),
                ),
                CustomTextFieldWithIcon(
                    EMAIL_ITALIAN, GREY, MAIN_PINK, 2, Icons.email, MAIN_BLACK
                ),
                Container(
                  margin: EdgeInsets.only(top: marginSmall(context)),
                  child: RoundedButton(
                      SEND_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
                ),
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