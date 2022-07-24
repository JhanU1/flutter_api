import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../../../domain/controllers/user_controller.dart';
import '../widgets/custom_fruit_list_tile.dart';
import 'fruit_create.dart';

class FruitUserPage extends StatelessWidget {
  FruitUserPage({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Your fruits",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            GetX<FruitController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final fruits = controller.fruits.where((fruit) =>
                      fruit.createdBy == userController.user!.userName);
                  return Expanded(
                      child: ListView.builder(
                    itemCount: fruits.length,
                    itemBuilder: (context, index) {
                      return CustomFruitListTile(
                        fruitRx: Rx<Fruit>(fruits.elementAt(index)),
                      );
                    },
                  ));
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "createUserFruit",
        onPressed: () {
          Get.to(() => const FruitCreate());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
