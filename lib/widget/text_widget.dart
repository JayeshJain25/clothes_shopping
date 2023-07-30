import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class PlayfairDisplayTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? fontWeight;
  final Color color;
  final Color? decColor;
  final bool? softWrapV;
  final int? maxLine;
  final TextOverflow? overFlowV;
  final double? letterSpacingV;
  final TextAlign? align;

  final TextDecoration? textDecoration;
  const PlayfairDisplayTextWidget({
    Key? key,
    required this.text,
    required this.textSize,
    this.fontWeight,
    required this.color,
    this.maxLine,
    this.align,
    this.textDecoration,
    this.overFlowV,
    this.softWrapV,
    this.decColor,
    this.letterSpacingV,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlowV ?? TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: align,
      softWrap: softWrapV ?? true,
      style: GoogleFonts.playfairDisplay(
        letterSpacing: letterSpacingV ?? 0,
        decoration: textDecoration,
        decorationColor: decColor ?? Colors.white,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
      ),
    );
  }
}

class WorkSansTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? fontWeight;
  final Color color;
  final Color? decColor;
  final bool? softWrapV;
  final int? maxLine;
  final TextOverflow? overFlowV;
  final double? letterSpacingV;
  final TextAlign? align;
  final double? height;

  final TextDecoration? textDecoration;
  const WorkSansTextWidget({
    Key? key,
    required this.text,
    required this.textSize,
    this.fontWeight,
    required this.color,
    this.maxLine,
    this.align,
    this.textDecoration,
    this.overFlowV,
    this.softWrapV,
    this.decColor,
    this.letterSpacingV,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlowV ?? TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: align,
      softWrap: softWrapV ?? true,
      style: GoogleFonts.workSans(
        height: height ?? 0.0,
        letterSpacing: letterSpacingV ?? 0,
        decoration: textDecoration,
        decorationColor: decColor ?? Colors.white,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color,
      ),
    );
  }
}
