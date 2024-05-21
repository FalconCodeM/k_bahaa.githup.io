import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/models/training_model.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class HistoryTrainingItem extends StatelessWidget {
  final TrainingModel trainingData;
  final Function() onTap;

  const HistoryTrainingItem({
    super.key,
    required this.trainingData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: EdgeInsets.all(10.w),
        padding: EdgeInsets.all(15.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: const Offset(1, 1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "Training time",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.grey.shade400,
                  ),
                  ReusableText(
                    text: trainingData.startTraining,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.grey.shade400,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "Training pods used",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.grey.shade400,
                  ),
                  ReusableText(
                    text: trainingData.podsCount.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
