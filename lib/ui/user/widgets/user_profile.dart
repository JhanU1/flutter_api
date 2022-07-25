import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';

class UserProfileWidget extends StatelessWidget {
  UserProfileWidget({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("User Profile"),
          Image.network(
            userController.user!.urlImage,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported_rounded),
          ),
          Text("Name: ${userController.user!.name}"),
          Text("Email: ${userController.user!.email}"),
          Text("Password: ${userController.user!.password}"),
        ],
      ),
    );
  }
}
