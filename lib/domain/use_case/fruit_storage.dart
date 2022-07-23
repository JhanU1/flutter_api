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
    _fruits = await _storage.read('fruits');
    if (_fruits == null) {
      await _storage.save('fruits', []);
    }
  }

  Future<Map<String, dynamic>?> readByName(String fruitName) async {
    final fruit = _fruits?.firstWhere(
        (fruit) => fruit?['fruitName'] == fruitName,
        orElse: () => null);
    if (fruit == null) {
      return Future.error('Fruit not found');
    } else {
      return fruit;
    }
  }

  Future<int> create(String fruitName, Fruit fruit) async {
    final storedFruit = await readByName(fruitName);
    if (storedFruit != null) {
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
    final storedFruit = await readByName(fruitName);
    if (storedFruit != null) {
      final data = fruit.toJson();
      for (final key in data.keys) {
        storedFruit[key] = data[key] ?? storedFruit[key];
        if (key == "nutritions") {
          if (data[key] != null) {
            for (var keyNutrition in data[key]) {
              storedFruit[key][keyNutrition] =
                  data[key][keyNutrition] ?? storedFruit[key][keyNutrition];
            }
          }
        }
      }
      await _storage.save("fruits", _fruits);
    }
  }

  Future<void> delete(String fruitName) async {
    final fruit = await readByName(fruitName);
    if (fruit != null) {
      _fruits?.remove(fruit);
      await _storage.save("fruits", _fruits);
    }
  }

  Future<List<Map<String, dynamic>?>?> read() async {
    return _fruits;
  }
}
