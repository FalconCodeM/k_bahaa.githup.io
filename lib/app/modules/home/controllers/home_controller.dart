import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:k_bahaa/app/data/errors/get_snack_bar.dart';
import 'package:k_bahaa/app/data/fake/fake_users.dart';
import 'package:k_bahaa/app/data/models/training_model.dart';
import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/repository/training_data_repository.dart';
import 'package:k_bahaa/app/modules/home/views/screens/history/history_screen.dart';
import 'package:k_bahaa/app/modules/home/views/screens/history/user_training_history_view.dart';
import 'package:k_bahaa/app/modules/home/views/screens/home_screen.dart';
import 'package:k_bahaa/app/modules/home/views/screens/start_training_screens/start_training.dart';
import 'package:k_bahaa/app/modules/home/views/screens/start_training_screens/start_training_screen.dart';
import 'package:k_bahaa/app/modules/home/views/screens/start_training_screens/training_result.dart';
import 'package:k_bahaa/app/routes/app_pages.dart';

class HomeController extends GetxController {
  TrainingDataRepository trainingDataRepository;

  HomeController({required this.trainingDataRepository});

  // for users data
  final userData = <User>[].obs;
  final newUserData = <User>[].obs;
  final trainingData = <TrainingModel>[].obs;

  // for bluetooth device connection
  final RxList<BluetoothDevice> devicesList = <BluetoothDevice>[].obs;
  BluetoothDevice? connectedDevice;
  List<BluetoothService> bluetoothServices = [];

  // for home page searching
  final searchingFormKey = GlobalKey<FormState>();
  final TextEditingController searchingTextFieldController =
      TextEditingController();

  // for bluetooth device
  final isConnected = true.obs;
  final isScanning = false.obs;
  final deviceName = "".obs;

  // ui view pages
  final selectPage = 0.obs;

  // all var value from settings screen
  final settingsFormKey = GlobalKey<FormState>();

  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController trainingTimeTextFieldController =
      TextEditingController();
  final setPod1 = 0.obs;
  final setPod2 = 0.obs;
  final setPod3 = 0.obs;
  final setPod4 = 0.obs;
  final setPod5 = 0.obs;
  final setPod6 = 0.obs;

  final selectedUserName = "".obs;
  final selectedTrainingTime = 0.obs;
  final selectedPods = 0.obs;
  final totalSecond = 0.obs;
  final message = "".obs;
  final messageColor = Colors.redAccent.obs;
  final messageFontSize = 24.0.obs;

  @override
  void onInit() {
    userData.assignAll(trainingDataRepository.readUsers());
    ever(userData, (_) => trainingDataRepository.writeUsers(userData));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // for changing home screen
  void changePage(int value) => selectPage.value = value;

  // for select home screen
  final List<Widget> selectScreen = [
    const HomeScreen(),
    const HistoryScreen(),
  ];

  // for bluetooth device add device to list
  void addDeviceToList(BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      devicesList.add(device);
    }
  }

  void bluetoothStartScan() {
    // Start scanning for devices
    FlutterBluePlus.startScan();

    // Fetch connected devices and add to list
    FlutterBluePlus.connectedDevices.forEach((device) {
      addDeviceToList(device);
    });

    // Listen to scan results and add devices to list
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        addDeviceToList(result.device);
      }
    });

    // Update scanning status
    isScanning.value = true;
  }

  void stopScan() {
    FlutterBluePlus.stopScan();
    isScanning.value = false;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    int retryCount = 0;
    const int maxRetries = 3;
    while (retryCount < maxRetries) {
      try {
        await device.connect();
        connectedDevice = device;
        isConnected.value = true;

        // Discover services
        discoverServices();
        return;
      } on FlutterBluePlusException catch (e) {
        retryCount++;
        logError(e);

        if (retryCount >= maxRetries) {
          AppErrors.errors("Connection Failed",
              "Failed to connect to ${device.name}. Error: ${e.description}");
        }
      }
    }
  }

  void disconnectDevice() {
    connectedDevice?.disconnect();
    connectedDevice = null;
    isConnected.value = false;
    bluetoothServices.clear();
  }

  void discoverServices() async {
    if (connectedDevice != null) {
      bluetoothServices = await connectedDevice!.discoverServices();
    }
  }

  Future<void> readCharacteristic(
      BluetoothCharacteristic characteristic) async {
    var value = await characteristic.read();
    // Handle the read value as needed
    print("Characteristic value: $value");
  }

  Future<void> writeCharacteristic(
      BluetoothCharacteristic characteristic, List<int> value) async {
    await characteristic.write(value);
    // Optionally, handle any response or result
  }

  void startTraining() {
    selectedUserName.value = nameTextFieldController.text.trim();
    totalSecond.value = int.parse(trainingTimeTextFieldController.text.trim());
    selectedTrainingTime.value =
        int.parse(trainingTimeTextFieldController.text.trim());
    if (selectedUserName.value.isNotEmpty &&
        totalSecond.value != 0 &&
        selectedPods.value != 0) {
      // will send here selectedPods to bluetooth device

      Timer.periodic(const Duration(seconds: 1), (timer) {
        // here will send to bluetooth device totalSecond

        // and will redirect to training page and start count after 3 message
        Get.to(const StartTraining());
        timer.cancel();
      });

      Timer.periodic(const Duration(seconds: 2), (timer) {
        message.value = "READY";
        messageColor.value = Colors.redAccent;
        messageFontSize.value = 24;
        timer.cancel();
      });

      Timer.periodic(const Duration(seconds: 3), (timer) {
        message.value = "STEADY";
        timer.cancel();
      });

      Timer.periodic(const Duration(seconds: 4), (timer) {
        message.value = "GO";
        startTrainingTimer();
        timer.cancel();
      });
    } else {
      AppErrors.errors("error", "Please complete all settings");
    }
  }

  void startTrainingTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSecond.value > 0) {
        totalSecond.value--;
      } else {
        timer.cancel();
        // Set message when timer expires

        message.value = 'Training is over... Go to see the results';
        messageColor.value = Colors.greenAccent;
        messageFontSize.value = 20;

        // in here will go to result page
        Get.to(const TrainingResult());

        // here you have to set all data from device
        trainingData.add(
          TrainingModel(
            // here you will add your response from device
            // pods: podsFromDevice,
            pods: FakeUsers.trainingData.pods.toList(),
            pods1: setPod1.value,
            pods2: setPod2.value,
            pods3: setPod3.value,
            pods4: setPod4.value,
            pods5: setPod5.value,
            pods6: setPod6.value,
            podsCount: selectedPods.value,
            startTraining:
                DateFormat("dd/mm/yyy hh:mm a").format(DateTime.now()),
          ),
        );
      }
    });
  }

  void searchingUser() {
    // Trim the input to avoid issues with extra spaces
    String searchQuery = searchingTextFieldController.text.trim();

    try {
      // Find the user based on the search text field input
      User userFound = userData.firstWhere(
            (element) => element.name == searchQuery,
      );

      // Navigate to the UserTrainingHistoryView if a user is found
      Get.to(UserTrainingHistoryView(userData: userFound));
    } catch (e) {
      // Handle the case where no user is found, e.g., show an error message
      AppErrors.errors("not found", "User not found");
      // Optionally, show a snackbar or a dialog to notify the user
      Get.snackbar(
        'Error',
        'User not found',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void savingData() {
    var currentTime = DateFormat("hh:mm a").format(DateTime.now());
    var adduser = User(
      name: selectedUserName.value,
      trainingTime: currentTime,
      trainingData: trainingData,
    );

    // Check if the user already exists in the list
    int existingUserIndex =
        userData.indexWhere((user) => user.name == selectedUserName.value);

    if (existingUserIndex != -1) {
      // Update the existing user's trainingTime and trainingData using copyWith
      var updatedUser = userData[existingUserIndex].copyWith(
        trainingTime: currentTime,
        trainingData: trainingData,
      );
      userData[existingUserIndex] = updatedUser;
      Get.offAndToNamed(Routes.HOME);
      AppErrors.success("success", "your data has saved successfully");
      _updateAllUserData();
    } else {
      // Add the new user to the list
      userData.add(adduser);
      Get.offAndToNamed(Routes.HOME);
      AppErrors.success("success", "your data has saved successfully");
      _updateAllUserData();
    }
  }

  void cancelData() {
    _updateAllUserData();
    Get.to(const StartTrainingScreen());
  }
  void _updateAllUserData() {
    setPod1.value = 0;
    setPod2.value = 0;
    setPod3.value = 0;
    setPod4.value = 0;
    setPod5.value = 0;
    setPod6.value = 0;
    selectedUserName.value = "";
    selectedTrainingTime.value = 0;
    selectedPods.value = 0;
    totalSecond.value = 0;
    nameTextFieldController.clear();
    trainingTimeTextFieldController.clear();
    userData.refresh();
  }

  void logError(FlutterBluePlusException e) {
    // Log the error details for further analysis
    print("FlutterBluePlusException: ${e.code}, ${e.description}");
  }


}
