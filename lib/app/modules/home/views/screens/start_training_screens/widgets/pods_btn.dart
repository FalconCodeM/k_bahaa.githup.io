import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class PodsBtn extends StatelessWidget {
  final String podName;
  final Color backgroundColor;
  final Color fontColor;
  final Function() onTap;

  const PodsBtn({
    super.key,
    required this.podName,
    required this.backgroundColor,
    required this.fontColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ReusableText(
          text: podName,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontColor: fontColor,
        ),
      ),
    );
  }
}
