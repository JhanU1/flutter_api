import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../use_case/user_storage.dart';

class UserController extends GetxController {
  UserController() {
    init();
  }

  final Rx<User?> _currentUser = Rx<User?>(null);
  final StorageUser _storageUser = Get.find<StorageUser>();
  User? get user => _currentUser.value;

  init() async {
    try {
      final user = await _storageUser.readUserLogged();
      _currentUser.value = User.fromJson(user);
    } catch (e) {
      _currentUser.value = null;
    }
  }

  Future<void> register({
    required name,
    required lastName,
    required userName,
    required password,
    required email,
    urlImage = "",
    description = "",
  }) async {
    try {
      await _storageUser.create(userName, {
        'name': name,
        'lastName': lastName,
        'userName': userName,
        'password': password,
        'email': email,
        'urlImage': urlImage,
        'description': description,
        'createdFruits': 0
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> login({
    required userName,
    required password,
  }) async {
    final user = await _storageUser.read(userName);

    if (user['password'] == password) {
      _currentUser.value = User.fromJson(user);
      await _storageUser.saveUserLogged(userName);
    } else {
      return Future.error('Password is incorrect');
    }
  }

  Future<void> logout() async {
    await _storageUser.deleteUserLogged();
    _currentUser.value = null;
  }

  Future<void> updateUser({
    name,
    lastName,
    required userName,
    password,
    email,
    urlImage,
    description,
    createdFruits,
  }) async {
    await _storageUser.update(userName, {
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'email': email,
      'urlImage': urlImage,
      'description': description,
      'createdFruits': createdFruits
    });
  }
}
