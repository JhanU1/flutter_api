import 'package:flutter/material.dart';

import 'package:flutter_api/ui/fruit/pages/responsive/fruits/fruit_page_responsive.dart';
import 'package:flutter_api/ui/user/Pages/user_profile.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';

import '../fruit/pages/responsive/fruit_user/fruit_page_responsive.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  final selectedPage = 0.obs;
  final listPage = [
    ResponsiveFruitPage(),
    ResponsiveFruitUserPage(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              //Logout button
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  await userController.logout();
                  Get.offAllNamed('/');
                },
              ),
            ],
          ),
          body: IndexedStack(
            index: selectedPage.value,
            children: listPage,
          ),
          bottomNavigationBar: BottomNavigationBar(
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
