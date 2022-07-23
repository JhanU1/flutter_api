import '../../services/storage.dart';

class StorageUser {
  StorageUser() {
    /// Initialize the storage
    _storage = Storage.to;
    init();
  }

  /// Storage service instance
  late Storage _storage;

  /// Ensures user storage exists
  init() async {
    final users = await _storage.read('users');
    if (!users) {
      await _storage.save('users', []);
    }
  }

  /// Read logged user from storage
  ///
  /// Returns a JSON object with the attributes of the user.
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
        orElse: () => null);
    if (!user) {
      users.add(data);
      await _storage.save("users", users);
    } else {
      return Future.error('User already exists');
    }
  }

  /// Read a user from storage
  ///
  /// Returns a JSON object with the attributes of the user.
  /// Uses the [userName] as key.
  Future<Map<String, dynamic>> read(String userName) async {
    final users = await _storage.read("users");
    final user = users.firstWhere((user) => user['userName'] == userName,
        orElse: () => null);
    if (user) {
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
        orElse: () => null);
    if (user) {
      for (final key in data.keys) {
        user[key] = data[key] ?? user[key];
      }
      await _storage.save(userName, data);
    } else {
      return Future.error('User does not exists');
    }
  }
}
