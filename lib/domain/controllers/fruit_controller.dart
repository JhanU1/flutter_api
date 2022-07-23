import 'package:flutter_api/domain/use_case/fruit_storage.dart';
import 'package:get/get.dart';

import '../../data/models/fruit_model.dart';
import '../../data/remote/data_api.dart';
import 'user_controller.dart';

class FruitController extends GetxController {
  FruitController() {
    init();
  }

  final RxList<Fruit> _fruits = <Fruit>[].obs;
  final _storageFruit = StorageFruit();
  final _apiProvider = ApiProvider.to;
  final UserController userController = Get.find();

  init() async {
    final apiFruits = await _apiProvider.getFruits();
    _fruits.value = apiFruits;
    final storageFruits = await getFruitsByUser();
    _fruits.addAll(storageFruits);
  }

  Future<List<Fruit>> getFruitsByUser() async {
    try {
      final fruits = await _storageFruit.read();
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

  addFruit(
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
    _fruits.add(fruit);
  }

  Future<void> deleteFruit(String name) async {
    await _storageFruit.delete(name);
    _fruits.removeWhere((element) => element.name == name);
  }

  Future<void> updateFruit({name, genus, family, nutritions}) async {
    final fruit =
        Fruit(genus: genus, family: family, name: name, nutritions: nutritions);

    await _storageFruit.update(name, fruit);
    _fruits.removeWhere((element) => element.name == name);
    _fruits.add(fruit);
  }
}
