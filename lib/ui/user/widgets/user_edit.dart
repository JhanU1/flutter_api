import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/responsive_controller.dart';
import '../../../domain/controllers/user_controller.dart';
import 'custom_user_form.dart';

class UserEditWidget extends StatelessWidget {
  /// Is a [StatelessWidget] that edit an user.
  ///
  /// This widget use an observable [User] to fill the fields.
  /// [user] is taken from the [UserController.user]
  UserEditWidget({Key? key}) : super(key: key);
  final _controller = Get.find<UserController>();
  final ResponsiveController responsiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Edit user",
            style: theme.textTheme.headline1,
          ),
          const SizedBox(height: 30),
          Expanded(
              child: ListView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            children: [UserForm(user: _controller.user)],
          )),
        ],
      ),
    );
  }
}
