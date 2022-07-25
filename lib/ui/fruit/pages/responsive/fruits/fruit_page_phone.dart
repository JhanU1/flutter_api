import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/fruit_model.dart';
import '../../../../../domain/controllers/fruit_controller.dart';
import '../../../../../domain/controllers/responsive_controller.dart';
import '../../../../widgets/custom_snackbar.dart';
import '../../../widgets/custom_fruit_list_tile.dart';
import '../../fruit_create_page.dart';
import '../../fruit_details_page.dart';
import '../../fruit_edit_page.dart';

class FruitPagePhone extends StatelessWidget {
  FruitPagePhone({Key? key}) : super(key: key);
  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder(builder: ),
          GetX<FruitController>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                    child: ListView.separated(
                  controller: ScrollController(),
                  separatorBuilder: (context, index) => const Divider(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.fruits.length,
                  itemBuilder: (context, index) {
                    final fruit = controller.fruits.reversed.elementAt(index);
                    final fruitRx = Rx<Fruit>(fruit);
                    return CustomFruitListTile(
                      fruitRx: fruitRx,
                      onTap: () {
                        controller.selectedFruit = fruitRx;
                        Get.to(() => FruitDetailsPage());
                      },
                      onEdit: () {
                        controller.selectedFruit = fruitRx;
                        Future.delayed(const Duration(milliseconds: 500),
                            () => Get.to(() => const FruitEditPage()));
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
        backgroundColor: theme.primaryColor,
        heroTag: "createFruit${DateTime.now()}",
        onPressed: () {
          Get.to(() => const FruitCreatePage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
