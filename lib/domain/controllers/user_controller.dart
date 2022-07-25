import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../use_case/user_storage.dart';

class UserController extends GetxController {
  UserController() {
    init();
  }

  /// [user] is a observable [User]. That is used to store the current user.
  ///
  /// [user] allows the user to see the user and update it.
  final Rx<User?> currentUser = Rx<User?>(null);

  /// [_storageUser] is used for user storage.
  ///
  /// [_storageUser] is a [StorageUser] that is used to read and save the user.
  final StorageUser _storageUser = Get.find<StorageUser>();
  User? get user => currentUser.value;

  /// [init] is a function that is used to initialize the current user.
  init() async {
    try {
      final user = await _storageUser.readUserLogged();
      currentUser.value = User.fromJson(user);
    } catch (e) {
      currentUser.value = null;
    }
  }

  /// [register] is used to register the user.
  ///
  /// The parameters of [register] are the [User] attributes.
  /// The [User] attributes are sending to [StorageUser] to save the user.
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
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  /// [login] is used to login the user.
  ///
  /// [userName] is the user name of the user.
  /// [password] is the password of the user.
  /// [login] updates the [currentUser] and saves the user in the [StorageUser].
  Future<void> login({
    required userName,
    required password,
  }) async {
    final user = await _storageUser.read(userName);

    if (user['password'] == password) {
      currentUser.value = User.fromJson(user);
      await _storageUser.saveUserLogged(userName);
    } else {
      return Future.error('Password is incorrect');
    }
  }

  /// [logout] is used to logout the user.
  ///
  /// [logout] deletes the user from the [StorageUser].
  /// [currentUser.value] is set to null.
  Future<void> logout() async {
    await _storageUser.deleteUserLogged();
    currentUser.value = null;
  }

  /// [updateUser] is used to update the user.
  ///
  /// [updateUser] updates the user in the [StorageUser].
  /// [currentUser.value] is updated.
  Future<void> updateUser({
    name,
    lastName,
    required userName,
    password,
    email,
    urlImage,
    description,
  }) async {
    await _storageUser.update(userName, {
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'email': email,
      'urlImage': urlImage,
      'description': description,
    });
    currentUser.value = User(
      name: name,
      lastName: lastName,
      userName: userName,
      password: password,
      email: email,
      urlImage: urlImage,
      description: description,
    );
  }
}
