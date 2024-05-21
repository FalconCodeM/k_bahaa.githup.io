import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:k_bahaa/app/data/widgets/reusable_button.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text_field.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';
import 'package:k_bahaa/app/modules/home/views/screens/start_training_screens/widgets/pods_btn.dart';

class StartTrainingScreen extends GetView<HomeController> {
  const StartTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableText(text: "Training Settings"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: controller.settingsFormKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5.w),
                            child: const ReusableText(text: "Name"),
                          ),
                          ReusableTextField(
                            width: 350,
                            controller: controller.nameTextFieldController,
                            errorMessage: "Please enter user name",
                            hintText: 'Enter user name',
                            imageName: 'assets/images/person.png',
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const ReusableText(text: "Training time"),
                          ReusableTextField(
                            width: 350,
                            controller:
                                controller.trainingTimeTextFieldController,
                            keyboardType: TextInputType.number,
                            errorMessage: "Please enter training time",
                            hintText: "Enter you training time in second",
                            imageName: "assets/images/clock.png",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const ReusableText(text: "choose sequence"),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PodsBtn(
                          podName: "Pod 1",
                          backgroundColor: controller.setPod1.value==1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod1.value==1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod1.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod1.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod1.value = 0;
                            }
                          },
                        ),
                        PodsBtn(
                          podName: "Pod 2",
                          backgroundColor: controller.setPod2.value == 1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod2.value == 1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod2.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod2.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod2.value = 0;
                            }
                          },
                        ),
                        PodsBtn(
                          podName: "Pod 3",
                          backgroundColor: controller.setPod3.value == 1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod3.value == 1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod3.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod3.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod3.value = 0;
                            }
                          },
                        ),
                        PodsBtn(
                          podName: "Pod 4",
                          backgroundColor: controller.setPod4.value == 1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod4.value == 1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod4.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod4.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod4.value = 0;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PodsBtn(
                          podName: "Pod 5",
                          backgroundColor: controller.setPod5.value == 1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod5.value == 1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod5.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod5.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod5.value = 0;
                            }
                          },
                        ),
                        PodsBtn(
                          podName: "Pod 6",
                          backgroundColor: controller.setPod6.value == 1
                              ? Colors.blue
                              : Colors.white,
                          fontColor: controller.setPod6.value == 1
                              ? Colors.white
                              : Colors.black,
                          onTap: () {
                            if (controller.setPod6.value == 0) {
                              controller.selectedPods.value += 1;
                              controller.setPod6.value = 1;
                            } else {
                              controller.selectedPods.value--;
                              controller.setPod6.value = 0;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 130.h,
                    ),
                    ReusableButton(
                      onTap: () {
                        if (controller.settingsFormKey.currentState!
                                .validate() &&
                            controller.selectedPods.value != 0) {
                          controller.startTraining();
                        } else {
                          Get.snackbar(
                            "error",
                            "Please complete all settings",
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.redAccent.shade400,
                            margin: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 10.w),
                            titleText: const ReusableText(
                              text: "error",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontColor: Colors.white,
                            ),
                            messageText: const ReusableText(
                              text: "Please complete all settings",
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              fontColor: Colors.white,
                            ),
                          );
                        }
                      },
                      text: "Start training",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
