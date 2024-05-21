import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';

class StartTraining extends GetView<HomeController> {
  const StartTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(text: "Start Training"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Section one
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ReusableText(
                          text: "Name",
                        ),
                        ReusableText(
                          text: controller.selectedUserName.value,
                          fontSize: 18,
                          fontColor: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: "Sequence",
                          fontSize: 18,
                          fontColor: Colors.grey.shade700,
                        ),
                        Row(
                          children: [
                            ReusableText(
                              text: controller.selectedPods.value.toString(),
                              fontSize: 16,
                              fontColor: Colors.grey.shade500,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            ReusableText(
                              text: "Pods",
                              fontSize: 16,
                              fontColor: Colors.grey.shade500,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: "average time",
                          fontSize: 18,
                          fontColor: Colors.grey.shade700,
                        ),
                        Row(
                          children: [
                            ReusableText(
                              text: controller.totalSecond.value.toString(),
                              fontSize: 16,
                              fontColor: Colors.grey.shade500,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            ReusableText(
                              text: "second",
                              fontSize: 16,
                              fontColor: Colors.grey.shade500,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Section Two
              Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h, bottom: 20.h),
                      child: ReusableText(
                        text: controller.message.value,
                        fontColor: controller.messageColor.value,
                        fontWeight: FontWeight.bold,
                        fontSize: controller.messageFontSize.value,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          text:
                              "${(controller.totalSecond.value ~/ 3600).toString().padLeft(2, '0')}:${((controller.totalSecond.value ~/ 60) % 60).toString().padLeft(2, '0')}:${(controller.totalSecond.value % 60).toString().padLeft(2, '0')}",
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontColor: Colors.grey.shade800,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
