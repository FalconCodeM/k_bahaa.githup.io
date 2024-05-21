import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/modules/home/views/screens/history/user_history_screen.dart';
import 'package:k_bahaa/app/modules/home/views/screens/items/history_training_item.dart';

class UserTrainingHistoryView extends StatelessWidget {
  final User userData;

  const UserTrainingHistoryView({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(
          text: "Training History",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Name",
                        fontSize: 16,
                        fontColor: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      ReusableText(
                        text: userData.name,
                        fontColor: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "last training",
                        fontSize: 16,
                        fontColor: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      ReusableText(
                        text: userData.trainingData.last.startTraining,
                        fontColor: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Training List",
                      fontSize: 16,
                      fontColor: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 525.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userData.trainingData.length,
                          itemBuilder: (_, i) {
                            return HistoryTrainingItem(
                              trainingData: userData.trainingData[i],
                              onTap: () => Get.to(
                                UserHistoryScreen(
                                  user: userData,
                                  trainingData: userData.trainingData[i],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
