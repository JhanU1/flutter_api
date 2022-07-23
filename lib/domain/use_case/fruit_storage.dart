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

  Future<void> create(String fruitName, Map<String, dynamic> data) async {
    final fruit = await readByName(fruitName);
    if (fruit != null) {
      _fruits?.add(data);
      await _storage.save("fruits", _fruits);
    } else {
      return Future.error('Fruit already exists');
    }
  }

  Future<void> update(String fruitName, Map<String, dynamic> data) async {
    final fruit = await readByName(fruitName);
    if (fruit != null) {
      for (final key in data.keys) {
        fruit[key] = data[key] ?? fruit[key];
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
