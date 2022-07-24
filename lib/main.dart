import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:flutter_api/domain/controllers/user_controller.dart';
import 'package:flutter_api/domain/use_case/user_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/remote/data_api.dart';
import 'domain/use_case/fruit_storage.dart';
import 'services/storage.dart';
import 'ui/my_app.dart';

void main() async {
  await GetStorage.init();
  Get.put(Storage());
  Get.put(ApiProvider());
  Get.put(StorageFruit());
  Get.put(StorageUser());
  Get.put(UserController());
  Get.put(FruitController());
  runApp(const MyApp());
}
