import 'dart:convert';

import 'package:get/get.dart';
import 'package:k_bahaa/app/data/keys/keys.dart';
import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/services/database_services.dart';

class TrainingDataProvider {
  final DataBaseService _service = Get.find<DataBaseService>();

  List<User> readUsers() {
    var users = <User>[];
    jsonDecode(_service.read(AppKeys.databaseKey).toString())
        .forEach((e) => users.add(User.fromJson(e)));
    return users;
  }

  void writeUsers(List<User> users){
    _service.write(AppKeys.databaseKey, jsonEncode(users));
  }
}
