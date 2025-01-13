import 'package:biiz/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? icerik;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  const CustomText({
    Key? key,
    required this.icerik,
    this.color = siyah,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = "popi",

}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(icerik!,style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,

    ),);
  }
}
