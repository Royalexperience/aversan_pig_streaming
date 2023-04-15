import 'package:aversan_pig_streaming/constants/font_sizes.dart';
import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';

abstract class Heading extends StatelessWidget {
  final String text;
  final BuildContext context;
  final Color? color;

  const Heading({super.key, required this.context, required this.text, this.color = MAIN_BLACK});

  @override
  Widget build(BuildContext context);

  TextStyle getStyle();
}

class Heading1 extends Heading {
  const Heading1({super.key, required BuildContext context, required String text, Color? color}) : super(context: context, text: text, color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
    );
  }

  @override
  TextStyle getStyle() {
    return TextStyle(
      fontSize: fontSizeHuge(context),
      color: color,
    );
  }
}

class Heading2 extends Heading {
  const Heading2({super.key, required BuildContext context, required String text, Color? color}) : super(context: context, text: text, color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
    );
  }

  @override
  TextStyle getStyle() {
    return TextStyle(
      fontSize: fontSizeBig(context),
      color: color,
    );
  }
}

class Heading3 extends Heading {
  const Heading3({super.key, required BuildContext context, required String text, Color? color}) : super(context: context, text: text, color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
    );
  }

  @override
  TextStyle getStyle() {
    return TextStyle(
      fontSize: fontSizeMid(context),
      color: color,
    );
  }
}

class Heading4 extends Heading {
  const Heading4({super.key, required BuildContext context, required String text, Color? color}) : super(context: context, text: text, color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
    );
  }

  @override
  TextStyle getStyle() {
    return TextStyle(
      fontSize: fontSizeSmall(context),
      color: color,
    );
  }
}