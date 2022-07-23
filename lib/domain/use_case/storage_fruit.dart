import '../../services/storage.dart';

class StorageFruit {
  StorageFruit() {
    _storage = Storage.to;
    init();
  }

  late Storage _storage;

  init() async {
    final users = await _storage.read('fruits');
    if (!users) {
      await _storage.save('fruits', []);
    }
  }

  Future<void> create(String fruitName, Map<String, dynamic> data) async {
    final fruits = await _storage.read("fruits");
    final fruit = fruits.firstWhere((fruit) => fruit['fruitName'] == fruitName,
        orElse: () => null);
    if (!fruit) {
      fruits.add(data);
      await _storage.save("fruits", fruits);
    } else {
      return Future.error('Fruit already exists');
    }
  }

  Future<void> update(String fruitName, Map<String, dynamic> data) async {
    final fruits = await _storage.read("fruits");
    final fruit = fruits.firstWhere((fruit) => fruit['fruitName'] == fruitName,
        orElse: () => null);
    if (fruit) {
      for (final key in data.keys) {
        fruit[key] = data[key] ?? fruit[key];
      }
      await _storage.save("fruits", fruits);
    } else {
      return Future.error('Fruit does not exists');
    }
  }

  Future<void> delete(String fruitName) async {
    final fruits = await _storage.read("fruits");
    final fruit = fruits.firstWhere((fruit) => fruit['fruitName'] == fruitName,
        orElse: () => null);
    if (fruit) {
      fruits.remove(fruit);
      await _storage.save("fruits", fruits);
    } else {
      return Future.error('Fruit does not exists');
    }
  }

  Future<List<Map<String, dynamic>>> read() async {
    final fruits = await _storage.read("fruits");
    return fruits;
  }
}
