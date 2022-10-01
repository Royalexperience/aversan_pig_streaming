import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;

  const RoundedButton(this.text, this.press, this.color, this.textColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          style: ButtonStyle()
        ),
      ),
    );
  }
}
