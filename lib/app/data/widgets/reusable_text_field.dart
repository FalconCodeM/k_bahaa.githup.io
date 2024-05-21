import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final String imageName;
  final bool isPassword;
  final double width;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String errorMessage;

  const ReusableTextField({
    super.key,
    required this.hintText,
    required this.imageName,
    this.isPassword = false,
    this.width = 300,
    this.keyboardType = TextInputType.multiline,
    required this.controller,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
      width: width.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 16.w,
            height: 16.h,
            margin: EdgeInsets.only(left: 17.w),
            child: Image(image: AssetImage(imageName)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.w),
            width: 250.w,
            height: 50.h,
            child: TextFormField(
              controller: controller,
              autocorrect: false,
              obscureText: isPassword ? true : false,
              keyboardType: keyboardType,
              validator: (value) {
                if (value!.isEmpty) {
                  Get.snackbar(
                    "error",
                    errorMessage,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent.shade400,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    titleText: const ReusableText(
                      text: "error",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontColor: Colors.white,
                    ),
                    messageText: ReusableText(
                      text: errorMessage,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontColor: Colors.white,
                    ),
                  );
                }
                return null;
              },
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
