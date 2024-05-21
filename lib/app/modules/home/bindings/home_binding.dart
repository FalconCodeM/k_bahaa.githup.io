import 'package:get/get.dart';
import 'package:k_bahaa/app/data/providers/training_data_provider.dart';
import 'package:k_bahaa/app/data/repository/training_data_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(trainingDataRepository: TrainingDataRepository(trainingDataProvider: TrainingDataProvider())),
    );
  }
}
