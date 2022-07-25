import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/user_controller.dart';
import 'package:flutter_api/ui/fruit/widgets/fruit_details.dart';
import 'package:flutter_api/ui/fruit/widgets/fruit_edit.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fruit_model.dart';
import '../../../../../domain/controllers/fruit_controller.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_fruit_list_tile.dart';
import '../../../widgets/fruit_create.dart';

class FruitUserPageTablet extends StatelessWidget {
  FruitUserPageTablet({Key? key}) : super(key: key);
  final FruitController fruitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
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
                  scrollDirection: Axis.vertical,
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
          GetX<FruitController>(builder: (controller) {
            if (controller.indexFruitUserPage.value == 0) {
              return Expanded(child: FruitDetailsWidget());
            } else if (controller.indexFruitUserPage.value == 1) {
              return Expanded(child: FruitEditWidget());
            } else {
              return const Expanded(child: FruitCreateWidget());
            }
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "createFruit${DateTime.now()}",
        onPressed: () {
          fruitController.indexFruitUserPage.value = 2;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
