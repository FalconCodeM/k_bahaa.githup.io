import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k_bahaa/app/app_main.dart';
import 'package:k_bahaa/app/data/services/database_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => DataBaseService().init());
  runApp(const MyApp());
}
