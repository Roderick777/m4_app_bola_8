import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m4_app_bola_8/data/constants.dart';

class CustomText extends StatefulWidget {
  const CustomText(
    this.text, {
    super.key,
    this.style = const TextStyle(color: kPrimaryTextColor),
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: GoogleFonts.titilliumWeb(textStyle: widget.style),
    );
  }
}
