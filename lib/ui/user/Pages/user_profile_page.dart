import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';
import '../widgets/user_profile.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
              controller: ScrollController(),
        children: [
          UserProfileWidget(),
        ],
      ),
    );
  }
}
