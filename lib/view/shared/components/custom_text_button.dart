import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color renk;
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.renk = mavi,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(
        fontFamily: "popi",
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: renk,
      ),),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
