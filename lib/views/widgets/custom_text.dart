import 'package:flutter/material.dart';
import 'package:tasky/views/styles/palette.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final String fontFamily;
  final double fontSize;
  final Color color;

  const CustomText({
    Key key,
    @required this.text,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize == null ? 14.0 : fontSize,
        fontWeight: fontWeight == null ? FontWeight.w400 : fontWeight,
        color: color == null ? Palette.text_primary : color,
        fontFamily: fontFamily,
      ),
    );
  }
}
