import 'package:flutter_api/domain/use_case/fruit_storage.dart';
import 'package:get/get.dart';

import '../../data/models/fruit_model.dart';
import '../../data/remote/data_api.dart';
import 'user_controller.dart';

class FruitController extends GetxController {
  FruitController() {
    getAllFruit();
  }

  final RxList<Fruit> fruits = <Fruit>[].obs;
  final _storageFruit = Get.find<StorageFruit>();
  final _apiProvider = ApiProvider.to;
  final UserController userController = Get.find();
  final RxBool isLoading = RxBool(true);

  getAllFruit() async {
    final apiFruits = await _apiProvider.getFruits();
    final storageFruits = _storageFruit.read();
    print(storageFruits);
    if (storageFruits != null) {
      storageFruits.sort(
          (a, b) => a!["createdBy"].compareTo(userController.user?.userName));
      fruits.value =
          storageFruits.map((fruit) => Fruit.fromJson(fruit!)).toList();
      fruits.addAll(apiFruits);
    } else {
      fruits.value = apiFruits;
    }

    isLoading.value = false;
  }

  Future<List<Fruit>> getFruitsByUser() async {
    try {
      final fruits = _storageFruit.read();
      return fruits!
          .where((element) =>
              element!['createdBy'] == userController.user?.userName)
          .map((e) => Fruit.fromJson(e!))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<Fruit> getFruidByFruitName(String fruitName) async {
    final fruit = await _storageFruit.readByName(fruitName);
    return Fruit.fromJson(fruit!);
  }

  Future<void> addFruit(
      {required genus,
      required family,
      required name,
      required nutritions,
      required createdBy}) async {
    final fruit = Fruit(
        genus: genus,
        family: family,
        name: name,
        nutritions: nutritions,
        createdBy: userController.user?.userName);

    int id = await _storageFruit.create(name, fruit);
    fruit.id = id;
    fruits.add(fruit);
  }

  Future<void> deleteFruit(String name) async {
    await _storageFruit.delete(name);
    fruits.removeWhere((element) => element.name == name);
  }

  Future<void> updateFruit({name, genus, family, nutritions}) async {
    final fruit = Fruit(
        genus: genus,
        family: family,
        name: name,
        nutritions: nutritions,
        createdBy: userController.user?.userName);

    await _storageFruit.update(name, fruit);
    final index = fruits.indexWhere((element) => element.name == name);
    fruits[index] = fruit;
  }
}
