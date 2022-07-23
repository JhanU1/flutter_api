import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../use_case/storage_user.dart';

class UserController extends GetxController {
  late Rx<User?> _currentUser;
  final StorageUser _storageUser = StorageUser();
  User? get user => _currentUser.value;

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
      return await _storageUser.create(userName, {
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
    try {
      final user = await _storageUser.read(userName);
      if (user['password'] == password) {
        _currentUser.value = User.fromJson(user);
      } else {
        return Future.error('Password is incorrect');
      }
    } catch (e) {
      return Future.error(e);
    }
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
    try {
      return await _storageUser.update(userName, {
        'name': name,
        'lastName': lastName,
        'userName': userName,
        'password': password,
        'email': email,
        'urlImage': urlImage,
        'description': description,
        'createdFruits': createdFruits
      });
    } catch (e) {
      return Future.error(e);
    }
  }
}
