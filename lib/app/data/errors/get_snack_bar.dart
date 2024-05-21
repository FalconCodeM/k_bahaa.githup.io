import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class AppErrors {
  AppErrors._();

  static void errors(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent.shade400,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      titleText: ReusableText(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontColor: Colors.white,
      ),
      messageText: ReusableText(
        text: message,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontColor: Colors.white,
      ),
    );
  }
  static void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.greenAccent.shade400,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      titleText: ReusableText(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontColor: Colors.white,
      ),
      messageText: ReusableText(
        text: message,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontColor: Colors.white,
      ),
    );
  }
}
