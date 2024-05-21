import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: controller.selectScreen[controller.selectPage.value],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: controller.selectPage.value,
          onTap: (value)=> controller.changePage(value),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey.shade600,
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: Icon(
                Icons.home,
                size: 25.sp,
              ),
            ),
            BottomNavigationBarItem(
              label: "history",
              icon: Icon(
                Icons.history,
                size: 25.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
