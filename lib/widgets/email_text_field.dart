import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool prefixIconFlag;

  const EmailTextField({super.key, required this.hintText, required this.controller, this.prefixIconFlag = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIconFlag ? Icon(EMAIL_ICON, color: MAIN_BLACK,) : null,
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          errorStyle: TextStyle(
            fontSize: fontSizeSmall(context),
          ),
        ),
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return THIS_FIELD_IS_COMPULSORY_ITALIAN;
          }
          else {
            return EmailValidator.validate(value) ? null : TYPE_A_VALID_EMAIL_ITALIAN;
          }
        },
      ),
    );
  }
}