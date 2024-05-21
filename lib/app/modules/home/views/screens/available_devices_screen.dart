import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k_bahaa/app/data/widgets/reusable_button.dart';
import 'package:k_bahaa/app/data/widgets/reusable_text.dart';
import 'package:k_bahaa/app/modules/home/controllers/home_controller.dart';

class AvailableDevicesScreen extends GetView<HomeController> {
  const AvailableDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Devices"),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25.h),
              height: 600.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.devicesList.length,
                itemBuilder: (context, index) {
                  final device = controller.devicesList[index];
                  // Ensure the device name is correctly displayed

                  return GestureDetector(
                    onTap: () async {
                      await controller.connectToDevice(device);
                      if (controller.isConnected.value) {
                        Get.snackbar(
                          "Connected",
                          "Connected to ${device.name.isNotEmpty ? device.name : "Unknown Device"}",
                          colorText: Colors.white,
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.greenAccent.shade400,
                          margin: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 10.w),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 20.w),
                      padding: EdgeInsets.all(15.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: device.isConnected ? Colors.grey : Colors.white,
                        borderRadius: BorderRadius.circular(25.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          Icon(
                            Icons.bluetooth,
                            size: 25.sp,
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Column(
                            children: [
                              ReusableText(
                                fontColor: device.name.isNotEmpty
                                    ? Colors.black
                                    : Colors.grey.shade600,
                                fontSize: 12,
                                fontWeight: device.name.isNotEmpty
                                    ? FontWeight.w400
                                    : FontWeight.bold,
                                text: device.name.isNotEmpty
                                    ? device.advName.isNotEmpty
                                        ? device.platformName.isNotEmpty
                                            ? device.localName.isNotEmpty
                                                ? device.localName
                                                : device.platformName
                                            : device.name
                                        : device.advName
                                    : "Unknown Device",
                              ),
                              ReusableText(
                                fontColor: device.name.isNotEmpty
                                    ? Colors.black
                                    : Colors.grey.shade600,
                                fontSize: 16,
                                fontWeight: device.name.isNotEmpty
                                    ? FontWeight.w400
                                    : FontWeight.bold,
                                text: device.id.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            controller.isScanning.value
                ? ReusableButton(
                    onTap: controller.stopScan,
                    text: "Stop Scan",
                    btnColor: Colors.redAccent.shade400,
                  )
                : ReusableButton(
                    onTap: controller.bluetoothStartScan,
                    text: "Start Scan",
                  ),
          ],
        ),
      ),
    );
  }
}
