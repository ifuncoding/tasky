import 'package:flutter/material.dart';
import 'package:tasky/views/styles/palette.dart';
import 'package:tasky/views/widgets/custom_text.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Function onTap;

  const ButtonPrimary({
    Key key,
    @required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = Palette.primary,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: backgroundColor,
        ),
        child: Center(
          child: CustomText(
            text,
            color: textColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            fontFamily: m_font_nunito,
          ),
        ),
      ),
    );
  }
}
