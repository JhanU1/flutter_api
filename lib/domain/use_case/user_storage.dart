import '../../services/storage.dart';

class StorageUser {
  /// Initialize the storage service and ensure that user storage exist.
  StorageUser() {
    _storage = Storage.to;
    init();
  }

  /// Storage service instance
  late Storage _storage;

  /// Ensures user storage exists
  ///
  /// If the user storage does not exist, it will be created
  /// with a burned Map that contains the [User] attributes.
  init() async {
    final users = await _storage.read('users');
    if (users == null) {
      final user = <String, dynamic>{
        "name": "Johan",
        "lastName": "Hurtado",
        "userName": "Johanl",
        "password": "123",
        "email": "admin@admin.com",
        "urlImage":
            "https://img.freepik.com/vector-premium/perfil-hombre-dibujos-animados_18591-58482.jpg?w=2000",
        "description": "Software developer",
        "createdFruits": 0
      };
      await _storage.save('users', [user]);
    }
  }

  /// Read logged user from storage
  ///
  /// Returns a Map with the attributes of the user.
  Future<Map<String, dynamic>> readUserLogged() async {
    final userName = await _storage.read('userLogged');
    final user = await read(userName);
    return user;
  }

  /// Save logged user in storage
  ///
  /// Ensures that the user is logged.
  ///  Just saves the [userName] in the storage.
  Future<void> saveUserLogged(String userName) async {
    await _storage.save('userLogged', userName);
  }

  /// Delete logged user from storage
  ///
  /// Deletes the [userName] from the storage.
  Future<void> deleteUserLogged() async {
    await _storage.delete('userLogged');
  }

  /// Create a new user in storage
  ///
  /// Ensures that the user is not already registered
  /// Saves the user [data] in the storage using the [userName] as key.
  Future<void> create(String userName, Map<String, dynamic> data) async {
    final users = await _storage.read("users");
    final user = users.firstWhere((user) => user['userName'] == userName,
        orElse: () => <String, dynamic>{});
    if (user.isEmpty) {
      users.add(data);
      await _storage.save("users", users);
    } else {
      return Future.error('User already exists');
    }
  }

  /// Read a user from storage
  ///
  /// Returns a Map with the attributes of the user.
  /// Uses the [userName] as key.
  Future<Map<String, dynamic>> read(String userName) async {
    final users = await _storage.read("users");
    final user = users.firstWhere((user) => user['userName'] == userName,
        orElse: () => <String, dynamic>{});
    if (user.isNotEmpty) {
      return user;
    } else {
      return Future.error('User does not exists');
    }
  }

  /// Update a user in storage
  ///
  /// Ensure that the user is registered and update just the attributes that are passed in [data].
  /// Uses the [userName] as key.
  Future<void> update(String userName, Map<String, dynamic> data) async {
    final users = await _storage.read("users");
    final user = users.firstWhere((user) => user['userName'] == userName,
        orElse: () => <String, dynamic>{});
    if (user.isNotEmpty) {
      for (final key in data.keys) {
        user[key] = data[key] ?? user[key];
      }
      await _storage.save(userName, data);
    } else {
      return Future.error('User does not exists');
    }
  }
}
