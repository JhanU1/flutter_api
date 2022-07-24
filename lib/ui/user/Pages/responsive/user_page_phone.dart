import 'package:flutter/material.dart';

import 'package:flutter_api/ui/user/Pages/user_edit_page.dart';
import 'package:flutter_api/ui/user/Pages/user_profile.dart';
import 'package:get/get.dart';

import '../../../../domain/controllers/user_controller.dart';

class UserProfilePhone extends StatelessWidget {
  UserProfilePhone({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        actions: [
          //Logout button
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await userController.logout();
              Get.offAllNamed('/');
            },
          ),
          IconButton(
              onPressed: () {
                Get.to(UserEditPage());
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: Center(
        child: Obx(
          () => UserProfile(),
        ),
      ),
    );
  }
}
