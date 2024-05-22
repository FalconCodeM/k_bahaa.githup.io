import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/models/training_model.dart';
import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/widgets/reusable_pods_item_for_list.dart';
import 'package:k_bahaa/app/data/widgets/reusable_pods_list_view.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class UserHistoryScreen extends StatelessWidget {
  final User user;
  final TrainingModel trainingData;

  const UserHistoryScreen({
    super.key,
    required this.user,
    required this.trainingData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(text: "user history"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(text: "Name"),
                ReusableText(text: user.name),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(text: "Training time"),
                ReusableText(text: user.trainingTime),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              width: double.infinity,
              height: 1.h,
              color: Colors.grey.shade200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ReusableText(
                      text: "Used",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.grey.shade400,
                    ),
                    ReusableText(
                      text: "Pods",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.grey.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ReusableText(
                      text: "Wrong",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.redAccent.shade400,
                    ),
                    ReusableText(
                      text: " touch",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.redAccent.shade400,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ReusableText(
                      text: "Right",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.greenAccent.shade700,
                    ),
                    ReusableText(
                      text: " touch",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.greenAccent.shade700,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ReusableText(
                      text: "Average reaction",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.blueAccent.shade400,
                    ),
                    ReusableText(
                      text: "time",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.blueAccent.shade400,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              width: double.infinity,
              height: 1.h,
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 300.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusablePodsListView(
                    pods1: trainingData.pods1 == 1 ? true : false,
                    pods2: trainingData.pods2 == 1 ? true : false,
                    pods3: trainingData.pods3 == 1 ? true : false,
                    pods4: trainingData.pods4 == 1 ? true : false,
                    pods5: trainingData.pods5 == 1 ? true : false,
                    pods6: trainingData.pods6 == 1 ? true : false,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: trainingData.podsCount,
                        itemBuilder: (_, i) {
                          final podsResult = trainingData.pods[i];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ReusablePodsItemForList(
                                podsName: podsResult.wrongTouch,
                                showText: true,
                              ),
                              ReusablePodsItemForList(
                                podsName: podsResult.rightTouch,
                                showText: true,
                              ),
                              ReusablePodsItemForList(
                                podsName: podsResult.averageReactionTime,
                                showText: true,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
