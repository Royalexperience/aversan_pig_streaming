import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:aversan_pig_streaming/screens/sign_in.dart';
import 'package:aversan_pig_streaming/widgets/circles_in_login_page.dart';
import 'package:aversan_pig_streaming/widgets/custom_text_field.dart';
import 'package:aversan_pig_streaming/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes/dark_color_scheme.dart';
import '../widgets/image_picker_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: WHITE, //change your color here
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: Circle(),
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(
              left: screenWidthPercentage(context, percentage: 0.1),
              right: screenWidthPercentage(context, percentage: 0.1),
              top: screenHeightPercentage(context, percentage: 0.12),
            ),
            scrollDirection: Axis.vertical,
            children: [
              ImagePickerButton(),
              CustomTextFieldWithIcon(
                  EMAIL, GREY, MAIN_PINK, 2, Icons.email, MAIN_BLACK),
              CustomTextFieldWithIcon(USERNAME, GREY, MAIN_PINK, 2,
                  Icons.account_circle, MAIN_BLACK),
              CustomTextFieldWithIcon(
                  PASSWORD,
                  GREY,
                  MAIN_PINK,
                  2,
                  obscureTextFlag: true,
                  Icons.lock_outlined,
                  MAIN_BLACK),
              CustomTextFieldWithIcon(
                  CONFIRM_PASSWORD_ITALIAN,
                  GREY,
                  MAIN_PINK,
                  2,
                  obscureTextFlag: true,
                  Icons.lock,
                  MAIN_BLACK),
              Container(
                margin: EdgeInsets.only(
                    top: screenHeightPercentage(context, percentage: 0.015)),
                child: RoundedButton(
                    SIGN_UP_TEXT_ITALIAN, () {}, MAIN_PINK, WHITE),
              ),
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
                          builder: (context) => const SignInPage()),
                    );
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewInsets.bottom)),
            ],
          ),
        ),
      ),
    );
  }
}