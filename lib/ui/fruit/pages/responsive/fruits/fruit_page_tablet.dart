import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/fruit_details.dart';
import 'package:flutter_api/ui/fruit/widgets/fruit_edit.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fruit_model.dart';
import '../../../../../domain/controllers/fruit_controller.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_fruit_list_tile.dart';
import '../../../widgets/fruit_create.dart';

class FruitPageTablet extends StatelessWidget {
  FruitPageTablet({Key? key}) : super(key: key);
  final FruitController fruitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          GetX<FruitController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.fruits.length,
                  itemBuilder: (context, index) {
                    final fruit = controller.fruits.reversed.elementAt(index);
                    return CustomFruitListTile(
                        fruitRx: Rx<Fruit>(fruit),
                        onTap: () {
                          fruitController.selectedFruit.value = fruit;
                          fruitController.indexFruitPage.value = 0;
                        },
                        onEdit: () {
                          fruitController.selectedFruit.value = fruit;
                          fruitController.indexFruitPage.value = 1;
                        },
                        onDelete: () async {
                          try {
                            await controller.deleteFruit(fruit.name);
                            showCustomSnackbar(
                              title: 'Fruit deleted',
                              message: 'Fruit deleted successfully',
                            );
                            fruitController.selectedFruit.value =
                                Fruit.fromJson({});
                            fruitController.indexFruitPage.value = 0;
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
            if (controller.indexFruitPage.value == 0) {
              return Expanded(child: FruitDetailsWidget());
            } else if (controller.indexFruitPage.value == 1) {
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
          fruitController.indexFruitPage.value = 2;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
