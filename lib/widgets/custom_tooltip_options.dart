import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomToolTipOptions {
  String toolText;
  String id;
  Color? textColor;
  Color? bgColor;
  double? textSize;
  double? padd;
  double? cornerRadius;
  double? toolTipWidth;
  double? arrowWidth;
  double? arrowHeight;
  bool enabled;
  ImageProvider? image;
  double? imageHeight;
  double? imageWidth;

  CustomToolTipOptions(
      {this.image,
      this.imageHeight,
      this.imageWidth,
      required this.toolText,
      this.textColor,
      this.arrowHeight,
      this.arrowWidth,
      this.bgColor,
      this.cornerRadius,
      this.padd,
      required this.id,
      this.textSize,
      this.toolTipWidth,
      required this.enabled});
}
