import 'package:flutter/material.dart';
import 'package:aversan_pig_streaming/constants/themes/helping_functions.dart';

// ignore: constant_identifier_names
const double FONT_SIZE_HUGE = 26.0;
// ignore: constant_identifier_names
const double FONT_SIZE_BIG = 18.0;
// ignore: constant_identifier_names
const double FONT_SIZE_MID = 16.0;
// ignore: constant_identifier_names
const double FONT_SIZE_SMALL = 12.0;

double fontSizeHuge(BuildContext context) =>
    screenHeightPercentage(context, percentage: 0.030);

double fontSizeBig(BuildContext context) =>
    screenHeightPercentage(context, percentage: 0.025);

double fontSizeMid(BuildContext context) =>
    screenHeightPercentage(context, percentage: 0.020);

double fontSizeSmall(BuildContext context) =>
    screenHeightPercentage(context, percentage: 0.015);