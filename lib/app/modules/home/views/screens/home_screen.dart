import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_button.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text_field.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';
import 'package:k_bahaa/app/modules/home/views/screens/available_devices_screen.dart';
import 'package:k_bahaa/app/modules/home/views/screens/start_training_screens/start_training_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              // App Bar
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ReusableText(
                          text: "Flash Trainer",
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const AvailableDevicesScreen()),
                          child: Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(100.w),
                            ),
                            child: Icon(
                              Icons.bluetooth_outlined,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    margin: EdgeInsets.only(
                      top: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                    ),
                  )
                ],
              ),

              // content page
              Column(
                children: [
                  // Device Connection State And Name
                  Obx(
                    () => Container(
                      padding: EdgeInsets.only(
                          top: 40.h, bottom: 30.h, right: 30.w, left: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ReusableText(
                            text: "Device name",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          ReusableText(
                            text: controller.isConnected.value
                                ? controller.deviceName.value
                                : "No Devices",
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontColor: controller.isConnected.value
                                ? Colors.greenAccent
                                : Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),

                  // Search Input
                  Form(
                    key: controller.searchingFormKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableTextField(
                          controller: controller.searchingTextFieldController,
                          errorMessage: "Please field input",
                          hintText: "Search",
                          imageName: "assets/images/search.png",
                        ),
                        GestureDetector(
                          onTap: controller.searchingUser,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 6.h),
                            padding: EdgeInsets.all(5.w),
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(15.w),
                            ),
                            child: const Image(
                              color: Colors.white,
                              image: AssetImage("assets/images/search.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Welcome Message
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // TODO add any Image in here or late it
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        clipBehavior: Clip.hardEdge,
                        width: 330.w,
                        height: 230.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[600]!,
                              blurRadius: 5,
                              offset: const Offset(1, 1),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage("assets/images/app_image_1.jpeg"),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        width: double.infinity,
                        child: ReusableText(
                          text:
                              "Track, analyze, and improve your performance. The essential tool for every athlete.",
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          fontColor: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),

                  // start training Button
                  SizedBox(
                    height: 40.h,
                  ),
                  Obx(
                    () => ReusableButton(
                      onTap: () {
                        if (controller.isConnected.value) {
                          Get.to(const StartTrainingScreen());
                        }
                      },
                      text: "Start Training",
                      btnColor: controller.isConnected.value
                          ? Colors.blue
                          : Colors.grey,
                    ),
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
