import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextField extends StatelessWidget {
  final String helperText;
  final Color helperTextColor;
  final Color focusBorderColor;
  final double focusBorderWidth;
  final TextEditingController? textController;
  final bool obscureTextFlag;

  const CustomTextField(this.helperText, this. helperTextColor, this.focusBorderColor, this.focusBorderWidth, {super.key, this.obscureTextFlag = false, this.textController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: Padding(
        padding: EdgeInsets.all(screenHeightPercentage(context,percentage: 0.01)),
        child: TextFormField(
            controller: textController,
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

class CustomTextFieldWithIcon extends CustomTextField {
  final IconData iconData;
  final Color iconColor;

  const CustomTextFieldWithIcon(String helperText, Color helperTextColor, Color focusBorderColor, double focusBorderWidth,
  this.iconData, this.iconColor, {super.key, super.obscureTextFlag, super.textController})
  : super(helperText, helperTextColor, focusBorderColor, focusBorderWidth);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: focusBorderWidth, color: focusBorderColor),
          ),
          hintText: helperText,
          filled: true,
          fillColor: WHITE,
          hintStyle: TextStyle(color: helperTextColor),
          suffixIcon: Icon(iconData, color: iconColor,),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          errorStyle: TextStyle(
            fontSize: fontSizeSmall(context),
            fontFamily: 'Coolvetica',
          ),
        ),
        obscureText: obscureTextFlag,
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Questo campo è obbligatorio';
          }
          return null;
        },
      ),
    );
  }
}

class EmailTextFormFieldWithIcon extends CustomTextField {
  final IconData iconData;
  final Color iconColor;

  const EmailTextFormFieldWithIcon(String helperText, Color helperTextColor, Color focusBorderColor, double focusBorderWidth,
  this.iconData, this.iconColor, {super.key, super.obscureTextFlag, super.textController})
  : super(helperText, helperTextColor, focusBorderColor, focusBorderWidth);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: focusBorderWidth, color: focusBorderColor),
          ),
          hintText: helperText,
          filled: true,
          fillColor: WHITE,
          hintStyle: TextStyle(color: helperTextColor),
          suffixIcon: Icon(iconData, color: iconColor,),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          errorStyle: TextStyle(
            fontSize: fontSizeSmall(context),
            fontFamily: 'Coolvetica',
          ),
        ),
        obscureText: obscureTextFlag,
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Questo campo è obbligatorio';
          }
          else {
            return EmailValidator.validate(value) ? null : 'Inserisci una e-mail valida';
          }
        },
      ),
    );
  }
}

class PasswordTextFormFieldWithIcon extends CustomTextField {
  final IconData iconData;
  final Color iconColor;

  const PasswordTextFormFieldWithIcon(String helperText, Color helperTextColor, Color focusBorderColor, double focusBorderWidth,
  this.iconData, this.iconColor, {super.key, super.obscureTextFlag = true, super.textController})
  : super(helperText, helperTextColor, focusBorderColor, focusBorderWidth);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: focusBorderWidth, color: focusBorderColor),
          ),
          hintText: helperText,
          filled: true,
          fillColor: WHITE,
          hintStyle: TextStyle(color: helperTextColor),
          suffixIcon: Icon(iconData, color: iconColor,),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          errorStyle: TextStyle(
            fontSize: fontSizeSmall(context),
            fontFamily: 'Coolvetica',
          ),
        ),
        obscureText: obscureTextFlag,
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Questo campo è obbligatorio';
          }
          return null;
        },
      ),
    );
  }
}

class ConfirmPasswordTextFormFieldWithIcon extends CustomTextField {
  final IconData iconData;
  final Color iconColor;
  final TextEditingController? passTextController;

  const ConfirmPasswordTextFormFieldWithIcon(String helperText, Color helperTextColor, Color focusBorderColor, double focusBorderWidth,
  this.iconData, this.iconColor, {super.key, super.obscureTextFlag = true, super.textController, this.passTextController,})
  : super(helperText, helperTextColor, focusBorderColor, focusBorderWidth);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: focusBorderWidth, color: focusBorderColor),
          ),
          hintText: helperText,
          filled: true,
          fillColor: WHITE,
          hintStyle: TextStyle(color: helperTextColor),
          suffixIcon: Icon(iconData, color: iconColor,),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeightPercentage(context, percentage: 0.016), horizontal: screenHeightPercentage(context, percentage: 0.016)),
          errorStyle: TextStyle(
            fontSize: fontSizeSmall(context),
            fontFamily: 'Coolvetica',
          ),
        ),
        obscureText: obscureTextFlag,
        enableSuggestions: false,
        autocorrect: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Questo campo è obbligatorio';
          }
          if (value != passTextController!.text) {
            return 'Le password non corrispondono';
          }
          return null;
        },
      ),
    );
  }
}