import 'dart:typed_data';

import '../../data/models/fruit_model.dart';
import '../../services/storage.dart';

class StorageFruit {
  StorageFruit() {
    _storage = Storage.to;
    init();
  }

  late Storage _storage;
  late List<Map<String, dynamic>?>? _fruits;

  init() async {
    //await _storage.delete('fruits');
    final fruits = await _storage.read('fruits');
    if (fruits == null) {
      await _storage.save('fruits', []);
      _fruits = [];
    } else {
      _fruits = fruits
          .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
          .toList();
    }
  }

  Future<Map<String, dynamic>?> readByName(String fruitName) async {
    final fruit = _fruits!
        .firstWhere((fruit) => fruit?['name'] == fruitName, orElse: () => {});
    if (fruit!.isEmpty) {
      return Future.error('Fruit not found');
    } else {
      return fruit;
    }
  }

  Future<int> create(String fruitName, Fruit fruit) async {
    final storedFruit = await readByName(fruitName).catchError((e) => null);
    if (storedFruit == null) {
      final data = fruit.toJson();
      data['id'] = _fruits?.length;
      _fruits?.add(fruit.toJson());
      await _storage.save("fruits", _fruits);
      return data['id']!;
    } else {
      return Future.error('Fruit already exists');
    }
  }

  Future<void> update(String fruitName, Fruit fruit) async {
    final storedFruit = await readByName(fruitName).catchError((e) => null);
    if (storedFruit != null) {
      if (fruit.createdBy! != storedFruit['createdBy']) {
        return Future.error('You can not update this fruit');
      } else {
        final data = fruit.toJson();
        for (final key in data.keys) {
          storedFruit[key] = data[key] ?? storedFruit[key];
          if (key == "nutritions") {
            if (data[key] != null) {
              for (var keyNutrition in data[key].keys) {
                storedFruit[key][keyNutrition] =
                    data[key][keyNutrition] ?? storedFruit[key][keyNutrition];
              }
            }
          }
        }
        await _storage.save("fruits", _fruits);
      }
    }
  }

  Future<void> delete(String fruitName) async {
    final fruit = await readByName(fruitName);
    if (fruit != null) {
      _fruits?.remove(fruit);
      await _storage.save("fruits", _fruits);
    }
  }

  List<Map<String, dynamic>?>? read() {
    return _fruits;
  }
}
