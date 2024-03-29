import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/strings.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

class PlainTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;

  const PlainTextField({super.key, required this.hintText, required this.controller, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      height: screenHeightPercentage(context,percentage: 0.08),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
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
          return null;
        },
      ),
    );
  }
}