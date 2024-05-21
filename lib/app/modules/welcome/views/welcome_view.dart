import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_button.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    height: 250.h,
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
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: const ReusableText(
                      text: "Flash Trainer",
                    ),
                  ),
                ],
              ),
              ReusableButton(
                onTap: () => Get.offAllNamed(Routes.HOME),
                text: "Get Start",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

