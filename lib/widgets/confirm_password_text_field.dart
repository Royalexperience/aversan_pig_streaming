import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController confirmPasswordController;
  final TextEditingController? passwordController;
  final bool prefixIconFlag;

  const ConfirmPasswordTextField({super.key, required this.hintText, required this.confirmPasswordController, this.passwordController, this.prefixIconFlag = false});

  @override
  State<StatefulWidget> createState() => _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: widget.confirmPasswordController,
        obscureText: _obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorStyle: TextStyle(fontSize: fontSizeSmall(context),),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          prefixIcon: widget.prefixIconFlag ? Icon(LOCK_OUTLINED_ICON, color: MAIN_BLACK,) : null,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              color: DARK_GREY,
              _obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _obscureText ? SHOW_TEXT_ITALIAN : HIDE_TEXT_ITALIAN,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return THIS_FIELD_IS_COMPULSORY_ITALIAN;
          }
          if (value != widget.passwordController!.text) {
            return PASSWORDS_DOES_NOT_MATCH_ITALIAN;
          }
          return null;
        },
      ),
    );
  }
}