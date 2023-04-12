import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/margins.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';
import 'package:flutter/material.dart';

class DarkModalBottom extends StatelessWidget {
  final String title;
  final String message;
  final Widget? button1;
  final Widget? button2;
  const DarkModalBottom({super.key, required this.title, required this.message, this.button1, this.button2});

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Titolo del modal
            Container(
              margin: EdgeInsets.only(top: marginMid(context)),
              child: Text(
              title,
              style: TextStyle(
                  fontSize: FONT_SIZE_HUGE, 
                  color: WHITE, 
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Messaggio del modal
            Container(
              margin: EdgeInsets.only(top: marginMid(context)),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: FONT_SIZE_BIG, 
                  color: WHITE, 
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Bottone che rimanda alla schermata di login
            Container(
              margin: EdgeInsets.only(top: marginMid(context)),
              child: button1,
            ),
            // Bottone che rimanda alla schermata di recupero password
            Container(
              margin: EdgeInsets.only(top: marginSmall(context)),
              child: button2,
            ),
          ],
        ),
      ),
    );
  }
}