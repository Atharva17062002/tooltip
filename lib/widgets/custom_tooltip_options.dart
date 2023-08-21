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


  CustomToolTipOptions(
      {
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

class CustomToolTip extends StatefulWidget {
  const CustomToolTip(
      {super.key, required this.customToolTipOptions, required this.button});

  @override
  State<CustomToolTip> createState() => _CustomToolTipState();

  final CustomToolTipOptions customToolTipOptions;
  final Widget button;
}

class _CustomToolTipState extends State<CustomToolTip> {
  @override
  Widget build(BuildContext context) {
    return Tooltip();
  }
}
