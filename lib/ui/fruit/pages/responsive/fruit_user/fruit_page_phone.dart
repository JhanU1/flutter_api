import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fruit_model.dart';
import '../../../../../domain/controllers/fruit_controller.dart';
import '../../../../../domain/controllers/user_controller.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_fruit_list_tile.dart';
import '../../fruit_create.dart';
import '../../fruit_details.dart';
import '../../fruit_edit.dart';

class FruitUserPagePhone extends StatelessWidget {
  const FruitUserPagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Fruit Page"),
          GetX<FruitController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final UserController userController = Get.find();
                final fruits = controller.fruits.where((fruit) =>
                    fruit.createdBy == userController.user!.userName);
                return Expanded(
                    child: ListView.builder(
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    final fruit = fruits.elementAt(index);
                    final fruitRx = Rx<Fruit>(fruit);
                    return CustomFruitListTile(
                      fruitRx: fruitRx,
                      onTap: () {
                        controller.selectedFruitUser = fruitRx;
                        Get.to(() => FruitDetails());
                      },
                      onEdit: () {
                        controller.selectedFruitUser = fruitRx;
                        Future.delayed(const Duration(milliseconds: 500),
                            () => Get.to(() => FruitEdit()));
                      },
                      onDelete: () async {
                        try {
                          await controller.deleteFruit(fruit.name);
                          Get.back();
                          showCustomSnackbar(
                            title: 'Fruit deleted',
                            message: 'Fruit deleted successfully',
                          );
                        } catch (e) {
                          showCustomSnackbar(
                            title: 'Error',
                            message: e.toString(),
                          );
                        }
                      },
                    );
                  },
                ));
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "createFruit",
        onPressed: () {
          Get.to(() => const FruitCreate());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
