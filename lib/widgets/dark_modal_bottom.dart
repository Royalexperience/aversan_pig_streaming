import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

class DarkModalBottom extends StatelessWidget {
  final Widget? child;
  const DarkModalBottom({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightPercentage(context, percentage: 0.35),
      decoration: BoxDecoration(
        color: DARK_BACKGROUND_COLOR_FULL,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenHeightPercentage(context, percentage: 0.040)),
          topRight: Radius.circular(screenHeightPercentage(context, percentage: 0.040)),
        ),
        border: Border.all(
          color: MAIN_PINK,
          width: 4,
        ),
      ),
      child: child,
    );
  }
}