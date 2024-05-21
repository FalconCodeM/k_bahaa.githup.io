import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const ReusableText({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w400,
    this.fontColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    );
  }
}
