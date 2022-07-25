import 'package:flutter/material.dart';

import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/responsive_controller.dart';
import '../../../domain/controllers/user_controller.dart';

class UserProfileWidget extends StatelessWidget {
  /// Is a [StatelessWidget] that show the user profile.
  ///
  /// This widget use an observable [User] to fill the details.
  /// [user] is taken from the [UserController.user]
  UserProfileWidget({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  final ResponsiveController responsiveController = Get.find();
  final FruitController fruitController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Obx(() => userController.user != null
        ? Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${userController.user!.userName} Profile",
                      style: theme.textTheme.headline1),
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(150),
                      child: Image.network(
                        userController.user!.urlImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.person_rounded,
                          color: Colors.grey,
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Description", style: theme.textTheme.headline2),
                  const SizedBox(height: 10),
                  Text(userController.user!.description,
                      style: TextStyle(
                        fontSize: theme.textTheme.subtitle1.fontSize,
                        color: theme.textTheme.subtitle1.color,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name", style: theme.textTheme.headline2),
                      Text(
                          "${userController.user!.name} ${userController.user!.lastName}",
                          style: theme.textTheme.headline3),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email", style: theme.textTheme.headline2),
                      Text(userController.user!.email,
                          style: theme.textTheme.headline3),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Created Fruits",
                            style: theme.textTheme.headline2),
                        Text(
                            fruitController.fruits
                                .where((element) =>
                                    element.createdBy ==
                                    userController.user!.userName)
                                .length
                                .toString(),
                            style: theme.textTheme.headline3),
                      ])
                ],
              ),
            ),
          )
        : Container());
  }
}
