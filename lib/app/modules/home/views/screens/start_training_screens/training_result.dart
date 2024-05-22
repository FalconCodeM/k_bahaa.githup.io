import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:k_bahaa/app/data/widgets/reusable_button.dart';
import 'package:k_bahaa/app/data/widgets/reusable_pods_item_for_list.dart';
import 'package:k_bahaa/app/data/widgets/reusable_pods_list_view.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';

class TrainingResult extends GetView<HomeController> {
  const TrainingResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(text: "Training Result"),
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
                ReusableText(text: controller.selectedUserName.value),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(text: "Sequence"),
                Row(
                  children: [
                    ReusableText(
                        text: controller.selectedPods.value.toString()),
                    SizedBox(
                      width: 5.w,
                    ),
                    const ReusableText(text: "Pods"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReusableText(text: "Training time"),
                Row(
                  children: [
                    ReusableText(
                        text: controller.selectedTrainingTime.value.toString()),
                    SizedBox(
                      width: 5.w,
                    ),
                    const ReusableText(text: "seconds"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              width: double.infinity,
              height: 1.h,
              color: Colors.blue.shade300,
            ),
            SizedBox(
              height: 20.h,
            ),
            ReusableText(text: "Training result"),
            SizedBox(
              height: 15.h,
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
                    pods1:
                        controller.trainingData.first.pods1 == 1 ? true : false,
                    pods2:
                        controller.trainingData.first.pods2 == 1 ? true : false,
                    pods3:
                        controller.trainingData.first.pods3 == 1 ? true : false,
                    pods4:
                        controller.trainingData.first.pods4 == 1 ? true : false,
                    pods5:
                        controller.trainingData.first.pods5 == 1 ? true : false,
                    pods6:
                        controller.trainingData.first.pods6 == 1 ? true : false,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.trainingData.first.podsCount,
                        itemBuilder: (_, i) {
                          final podsResult =
                              controller.trainingData.first.pods[i];
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
            SizedBox(
              height: 15.h,
            ),
            ReusableButton(onTap:controller.savingData, text: "Save"),
            ReusableButton(onTap:controller.cancelData, text: "cancel",btnColor: Colors.redAccent.shade400,)
          ],
        ),
      ),
    );
  }
}


