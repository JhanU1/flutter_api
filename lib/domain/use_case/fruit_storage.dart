import '../../data/models/fruit_model.dart';
import '../../services/storage.dart';

class StorageFruit {
  /// Initialize the storage service and ensure that fruit storage exist.
  StorageFruit() {
    _storage = Storage.to;
    init();
  }

  /// Storage service instance
  ///
  /// [_storage] is a [Storage] object that is used to read and save data.
  late Storage _storage;

  /// [_fruits] is a list of maps with the attributes of the fruits.
  ///
  /// [_fruits] is used to save, read and delete fruits.
  late List<Map<String, dynamic>?>? _fruits;

  /// Ensures fruit storage exists
  ///
  /// If the fruit storage does not exist, it will be created with list empty.
  init() async {
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

  /// Read a fruit from storage
  ///
  /// [readByName] read a fruit from storage with name equal to [fruitName].
  Future<Map<String, dynamic>?> readByName(String fruitName) async {
    final fruit = _fruits!
        .firstWhere((fruit) => fruit?['name'] == fruitName, orElse: () => {});
    if (fruit!.isEmpty) {
      return Future.error('Fruit not found');
    } else {
      return fruit;
    }
  }

  /// create a new fruit in storage
  ///
  /// Ensures that the fruit is not already registered
  /// Saves the [fruit] data in the storage using the [fruitName] as key.
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

  /// Update a fruit in storage
  ///
  /// Ensures that the fruit is registered
  /// Updates the [fruit] data in the storage using the [fruitName] as key.
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

  /// Delete a fruit from storage
  ///
  /// Ensures that the fruit is registered
  /// Deletes the [fruit] data in the storage using the [fruitName] as key.
  Future<void> delete(String fruitName) async {
    final fruit = await readByName(fruitName);
    if (fruit != null) {
      _fruits?.remove(fruit);
      await _storage.save("fruits", _fruits);
    }
  }

  /// Read all fruits from storage
  List<Map<String, dynamic>?>? read() {
    return _fruits;
  }
}
