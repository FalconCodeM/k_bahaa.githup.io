import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';
import 'package:k_bahaa/app/modules/home/views/screens/history/user_training_history_view.dart';
import 'package:k_bahaa/app/modules/home/views/screens/items/history_item.dart';
import 'package:k_bahaa/app/modules/home/views/screens/history/user_history_screen.dart';

class HistoryScreen extends GetView<HomeController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            children: [
              const ReusableText(
                text: "History",
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: controller.userData.isEmpty
                    ? const Center(
                        child: ReusableText(text: 'No users found.'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.userData.length,
                        itemBuilder: (_, i) {
                          final userData = controller.userData[i];
                          return HistoryTime(
                            userData: userData,
                            onTap: () => Get.to(
                                UserTrainingHistoryView(userData: userData),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
