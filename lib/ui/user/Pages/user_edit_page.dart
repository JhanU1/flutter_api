import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';
import '../widgets/custom_user_form.dart';

class UserEditPage extends StatelessWidget {
  UserEditPage({Key? key}) : super(key: key);
  final _controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text("Edit User Page"),
              UserForm(user: _controller.user),
            ],
          ),
        ),
      ),
    );
  }
}
