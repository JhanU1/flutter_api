import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxService {
  static Storage get to => Get.find();
  final GetStorage _storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> save(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  Future<dynamic> read(String key) async {
    return await _storage.read(key);
  }

  Future<void> delete(String key) async {
    await _storage.remove(key);
  }
}
