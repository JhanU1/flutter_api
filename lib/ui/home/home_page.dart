import 'package:flutter/material.dart';
import 'package:flutterapi/domain/controllers/responsive_controller.dart';

import 'package:flutterapi/ui/fruit/pages/responsive/fruits/fruit_page_responsive.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';

import '../fruit/pages/responsive/fruit_user/fruit_user_page_responsive.dart';
import '../user/Pages/responsive/user_responsive_page.dart';
import '../user/Pages/user_edit_page.dart';

class HomePage extends StatelessWidget {
  /// Is a [StatelessWidget] that show home page.
  ///
  /// This widget use [Scaffold] and responsives widgets to show home page.
  HomePage({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  final selectedPage = 0.obs;
  final ResponsiveController responsiveController = Get.find();
  final listPage = [
    ResponsiveFruitPage(),
    ResponsiveFruitUserPage(),
    ResponsiveUserPage()
  ];
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: theme.primaryColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  Get.offAllNamed('/');
                  await userController.logout();
                },
              ),
              if (responsiveController.isMobile)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => Get.to(() => const UserEditPage()),
                )
            ],
          ),
          body: IndexedStack(
            index: selectedPage.value,
            children: listPage,
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: theme.primaryColor,
              currentIndex: selectedPage.value,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grass), label: "Your Fruits"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
              onTap: (index) {
                selectedPage.value = index;
              }),
        ));
  }
}
