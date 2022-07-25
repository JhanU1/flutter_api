import 'package:flutter_api/domain/use_case/fruit_storage.dart';
import 'package:get/get.dart';

import '../../data/models/fruit_model.dart';
import '../../data/remote/data_api.dart';
import 'user_controller.dart';

class FruitController extends GetxController {
  FruitController() {
    getAllFruit();
  }

  /// List of fruits
  ///
  /// [fruits] is a observable list of [Fruit]. That is used to store the fruits.
  /// [fruits] allows the user to see the fruit and update it.
  final RxList<Fruit> fruits = <Fruit>[].obs;

  /// [selectedFruit] is used for fruit responsive pages.
  ///
  /// [selectedFruit] is a observable [Fruit] that is used to store the fruit that is selected.
  /// [selectedFruit] allows the user to see the fruit and update it.
  Rx<Fruit> selectedFruit = Rx<Fruit>(Fruit.fromJson({}));

  /// [indexFruitPage] is used for fruit responsive pages.
  ///
  /// [indexFruitPage] is a observable int that is used to store the index of the fruit page.
  /// [indexFruitPage] allows the user to change the fruit page.
  final RxInt indexFruitPage = RxInt(0);

  /// [selectedFruitUser] is used for user fruits responsive pages.
  ///
  /// [selectedFruitUser] is a observable [Fruit] that is used to store the fruit that is selected.
  /// In this case [selectedFruitUser] indicates what is the selected fruit in the user fruits page.
  Rx<Fruit> selectedFruitUser = Rx<Fruit>(Fruit.fromJson({}));

  /// [indexFruitUserPage] is used for user fruits responsive pages.
  ///
  /// [indexFruitUserPage] is a observable int that is used to store the index of the user fruits page.
  /// [indexFruitUserPage] allows the user to change the user fruits page.
  final RxInt indexFruitUserPage = RxInt(0);

  /// [_storageFruit] is used for fruit storage.
  ///
  /// [_storageFruit] is a [FruitStorage] that is used to store the fruit.
  /// [_storageFruit] allows using the [FruitStorage] to save and read the fruit.
  final _storageFruit = Get.find<StorageFruit>();

  /// [_apiProvider] is used for data api.
  ///
  /// [_apiProvider] is a [ApiProvider] that is used to get the data from the api.
  final _apiProvider = ApiProvider.to;

  /// [userController] is used for user controller.
  ///
  /// [userController] is a [UserController] that is used to get information about current user.
  final UserController userController = Get.find();

  /// [isLoading] is used for fruit loading.
  ///
  /// [isLoading] is a observable bool that is used to store if [getAllFruit] is loading.
  final RxBool isLoading = RxBool(true);

  /// [getAllFruit] is used for getting all fruits.
  ///
  /// [getAllFruit] is a function that is used to get all fruits from the [ApiProvider] and [StorageFruit].
  /// them store the fruits in [fruits] and [isLoading] is set to false.
  /// [getAllFruit] is called when the user is logged in.
  getAllFruit() async {
    final apiFruits = await _apiProvider.getFruits();
    final storageFruits = _storageFruit.read();
    if (storageFruits != null && userController.user != null) {
      storageFruits.sort(
          (a, b) => b!["createdBy"].compareTo(userController.user?.userName));
      fruits.value = apiFruits;
      fruits.addAll(storageFruits.map((fruit) => Fruit.fromJson(fruit!)));
    }
    isLoading.value = false;
  }

  //// [getFruitsByUser] is used for getting a fruit.
  ///
  /// [getFruitsByUser] is a function that is used to get fruits from the [StorageFruit]
  /// by the user name.
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

  /// [getFruidByFruitName] is used for getting a fruit by fruit name.
  ///
  /// [getFruidByFruitName] is a function that is used to get a fruit from the [StorageFruit]
  Future<Fruit> getFruidByFruitName(String fruitName) async {
    final fruit = await _storageFruit.readByName(fruitName);
    return Fruit.fromJson(fruit!);
  }

  /// [addFruit] is used for adding a fruit.
  ///
  /// [addFruit] is a function that is used to add a fruit to the [StorageFruit].
  /// [addFruit] updates the observable [fruits].
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

  /// [deleteFruit] is used for deleting a fruit.
  ///
  /// [deleteFruit] is a function that is used to delete a fruit from the [StorageFruit].
  /// [deleteFruit] updates the observable [fruits].
  Future<void> deleteFruit(String name) async {
    await _storageFruit.delete(name);
    fruits.removeWhere((element) => element.name == name);
  }

  /// [updateFruit] is used for updating a fruit.
  ///
  /// [updateFruit] is a function that is used to update a fruit to the [StorageFruit].
  /// [updateFruit] updates the observable [fruits].
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
