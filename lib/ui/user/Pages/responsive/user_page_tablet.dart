import 'package:flutter/material.dart';

import 'package:flutter_api/ui/user/Pages/user_edit_page.dart';
import 'package:flutter_api/ui/user/Pages/user_profile.dart';
import 'package:get/get.dart';

import '../../../../domain/controllers/user_controller.dart';

class UserProfileTablet extends StatelessWidget {
  UserProfileTablet({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [UserProfile(), UserEditPage()],
          ),
        ),
      ),
    );
  }
}
