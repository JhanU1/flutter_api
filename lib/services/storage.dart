import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxService {
  /// get [to] obtain the [Storage] instance.
  static Storage get to => Get.find();

  //// [_storage] is a [GetStorage] that is used to store the data.
  final GetStorage _storage = GetStorage();

  /// [save] is used to save the data.
  ///
  /// [key] is a string that represents the key of the data.
  /// [value] is the data that is going to be saved.
  Future<void> save(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// [read] is used to read the data.
  ///
  /// [key] is a string that represents the key of the data.
  Future<dynamic> read(String key) async {
    return await _storage.read(key);
  }

  /// [delete] is used to remove the data.
  ///
  /// [key] is a string that represents the key of the data that is going to be removed.
  Future<void> delete(String key) async {
    await _storage.remove(key);
  }
}
