import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/user_controller.dart';
import 'package:flutter_api/ui/fruit/pages/fruit_details.dart';
import 'package:flutter_api/ui/fruit/pages/fruit_edit.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fruit_model.dart';
import '../../../../../domain/controllers/fruit_controller.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_fruit_list_tile.dart';
import '../../fruit_create.dart';

class FruitUserPageTablet extends StatelessWidget {
  FruitUserPageTablet({Key? key}) : super(key: key);
  final FruitController fruitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: GetX<FruitController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final UserController userController = Get.find();
                  final fruits = controller.fruits.where((fruit) =>
                      fruit.createdBy == userController.user!.userName);
                  return Expanded(
                      child: ListView.builder(
                    itemCount: controller.fruits.length,
                    itemBuilder: (context, index) {
                      final fruit = fruits.elementAt(index);
                      return CustomFruitListTile(
                          fruitRx: Rx<Fruit>(fruit),
                          onTap: () {
                            fruitController.selectedFruitUser.value = fruit;
                            fruitController.indexFruitUserPage.value = 0;
                          },
                          onEdit: () {
                            fruitController.selectedFruitUser.value = fruit;
                            fruitController.indexFruitUserPage.value = 1;
                          },
                          onDelete: () async {
                            try {
                              await controller.deleteFruit(fruit.name);
                              showCustomSnackbar(
                                title: 'Fruit deleted',
                                message: 'Fruit deleted successfully',
                              );
                              fruitController.selectedFruitUser.value =
                                  Fruit.fromJson({});
                              fruitController.indexFruitUserPage.value = 0;
                            } catch (e) {
                              showCustomSnackbar(
                                title: 'Error',
                                message: e.toString(),
                              );
                            }
                          });
                    },
                  ));
                }
              },
            ),
          ),
          Obx(() => Expanded(
                flex: 2,
                child: IndexedStack(
                  index: fruitController.indexFruitPage.value,
                  children: [FruitDetails(), FruitEdit(), const FruitCreate()],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "createFruit",
        onPressed: () {
          fruitController.indexFruitPage.value = 2;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
