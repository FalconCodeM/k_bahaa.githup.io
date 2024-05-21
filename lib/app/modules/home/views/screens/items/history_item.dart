import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class HistoryTime extends StatelessWidget {
  final User userData;
  final Function() onTap;

  const HistoryTime({
    super.key,
    required this.userData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: userData.name,
                  fontSize: 18,
                  fontColor: Colors.grey.shade800,
                  fontWeight: FontWeight.w400,
                ),
                ReusableText(
                  text: userData.trainingTime,
                  fontSize: 12,
                  fontColor: Colors.grey.shade700,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(text: "Training count"),
                  ReusableText(text: userData.trainingData.length.toString())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
