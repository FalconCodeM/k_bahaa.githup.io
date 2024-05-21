import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class ReusableButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color btnColor;

  const ReusableButton({
    super.key,
    required this.onTap,
    required this.text,
    this.btnColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600]!,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: ReusableText(
            text: text,
            fontSize: 16,
            fontColor: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
