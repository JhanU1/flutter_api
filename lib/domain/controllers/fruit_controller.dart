import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/fruit_model.dart';

class FruitController extends GetxController {
  GetStorage _storage = GetStorage();
  RxList<Fruit> _fruits = <Fruit>[].obs;

  get getFruitsList => _fruits.value;

  addFruit(Fruit fruit) {
    _fruits.add(fruit);
  }

  removeFruit(Fruit fruit) {
    _fruits.remove(fruit);
  }
}
