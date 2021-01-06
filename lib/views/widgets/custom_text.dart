import 'package:flutter/material.dart';
import 'package:tasky/views/styles/palette.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const CustomText(
    this.text, {
    Key key,
    this.fontWeight = FontWeight.w400,
    this.fontFamily,
    this.fontSize = 14.0,
    this.color = Palette.text_primary,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
    );
  }
}
