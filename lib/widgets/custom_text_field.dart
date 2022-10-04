import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String helperText;
  final Color helperTextColor;
  final Color focusBorderColor;
  final double focusBorderWidth;
  final bool obscureTextFlag;

  const CustomTextField(this.helperText, this. helperTextColor, this.focusBorderColor, this.focusBorderWidth, {super.key, this.obscureTextFlag = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(9),
        child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: focusBorderWidth, color: focusBorderColor),
              ),
              hintText: helperText,
              filled: true,
              fillColor: WHITE,
              hintStyle: TextStyle(color: helperTextColor),
            ),
            obscureText: obscureTextFlag,
            enableSuggestions: false,
            autocorrect: false,
          ),)
    );
  }
}