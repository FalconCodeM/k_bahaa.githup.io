import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class ReusablePodsItemForList extends StatelessWidget {
  final String podsName;
  final bool showText;

  const ReusablePodsItemForList({
    super.key,
    required this.podsName,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: showText
          ? ReusableText(
        text: podsName,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontColor: Colors.grey.shade400,
      )
          : Container(),
    );
  }
}
