import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

import '../constants/themes/dark_color_scheme.dart';

class ButtonOnlyText extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  const ButtonOnlyText(this.text,
      {super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHeightPercentage(context, percentage: 0.04)),
      child: InkWell(
        onTap: onPress,
        child: Text(
          text,
          style: TextStyle(fontSize: FONT_SIZE_MID, color: WHITE),
        ),
      ),
    );
  }
}