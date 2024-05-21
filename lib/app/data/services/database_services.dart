import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:k_bahaa/app/data/keys/keys.dart';

class DataBaseService extends GetxService {
  late GetStorage _box;

  Future<DataBaseService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(AppKeys.databaseKey, []);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
