import 'package:flutter/material.dart';

import 'package:flutterapi/ui/user/widgets/user_edit.dart';
import 'package:flutterapi/ui/user/widgets/user_profile.dart';
import 'package:get/get.dart';

import '../../../../domain/controllers/user_controller.dart';

class UserProfileTablet extends StatelessWidget {
  /// Is a [StatelessWidget] that show user profile page in tablet.
  ///
  /// This widget use [Scaffold] and [UserProfileTablet] to show user profile.
  UserProfileTablet({Key? key}) : super(key: key);
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(
              children: [
                UserProfileWidget(),
              ],
            )),
            Expanded(child: UserEditWidget())
          ],
        ),
      ),
    );
  }
}
