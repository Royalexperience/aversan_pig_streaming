// ignore_for_file: file_names
import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  const RoundedButton(this.text, this.press, this.color, this.textColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width * 0.85;

    return SizedBox(
        width: yourWidth,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(fontSize: FONT_SIZE_MID, color: textColor),
          ),
        ));
  }
}

class RoundendButtonWithIcon extends RoundedButton {
  final IconData iconData;
  const RoundendButtonWithIcon(String text, VoidCallback press, Color color,
      Color textColor, this.iconData,
      {super.key})
      : super(text, press, color, textColor);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width * 0.85;

    return SizedBox(
        width: yourWidth,
        height: 50,
        child: ElevatedButton.icon(
          icon: Icon(iconData,color: MAIN_BLACK),
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
          onPressed: press,
          label: Text(
            text,
            style: TextStyle(fontSize: FONT_SIZE_MID, color: textColor),
          ),
        ));
  }
}
