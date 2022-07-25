import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';
import 'custom_user_form.dart';

class UserEditWidget extends StatelessWidget {
  UserEditWidget({Key? key}) : super(key: key);
  final _controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            const Text("Edit User Page"),
            Expanded(
                child: ListView(
              scrollDirection: Axis.vertical,
              children: [UserForm(user: _controller.user)],
            )),
          ],
        ),
      ),
    );
  }
}
