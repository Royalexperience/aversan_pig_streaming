import 'package:aversan_pig_streaming/constants/themes/dark_color_scheme.dart';
import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pinkCircles = Paint()
      ..color = PINK_FOR_CIRCLES
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    // ignore: non_constant_identifier_names
    final Offset TOP_LEFT = Offset(0, 0);
    // ignore: non_constant_identifier_names
    final Offset BOTTOM_RIGHT = Offset(size.width, size.height);

    // Draws a circle in the top Left Corner and it's radius is 40 % of the width
    canvas.drawCircle(TOP_LEFT, size.width * 0.4, pinkCircles);
    
    //Draws the same circle but in the Bottom right of the page 
    canvas.drawCircle(BOTTOM_RIGHT, size.width * 0.4, pinkCircles);
  }

    // Default method, sets circles to be static 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
