import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? fontSize;
  final Color? sideColor;
  final Color? textColor;
  final bool isLoading; // isLoading'i opsiyonel olmaktan çıkardık
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize,
    this.sideColor,
    this.textColor,
    this.borderRadius = 20,
    this.isLoading = false, // Varsayılan değer false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      // Loading durumunda butonu disable et
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme
            .of(context)
            .primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: sideColor ?? Theme
                .of(context)
                .primaryColor,
            width: 2,
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
        height: (fontSize ?? 16.0), // Text ile aynı yükseklikte olması için
        width: (fontSize ?? 16.0),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: textColor ?? Theme
              .of(context)
              .canvasColor,
        ),
      )
          : Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16.0,
          color: textColor ?? Theme
              .of(context)
              .canvasColor,
          fontFamily: "popi",
        ),
      ),
    );
  }
}