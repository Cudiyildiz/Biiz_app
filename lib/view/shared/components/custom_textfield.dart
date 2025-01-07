import 'package:biiz/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.icon,
    this.obsruceText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  final IconButton? icon;
  final bool obsruceText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsruceText,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: icon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: mavi),
        ),
      ),
    );
  }
}
