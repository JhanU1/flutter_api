import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../widgets/custom_fruit_list_tile.dart';
import 'fruit_create.dart';

class FruitPage extends StatelessWidget {
  const FruitPage({Key? key}) : super(key: key);

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
                return Expanded(
                    child: ListView.builder(
                  itemCount: controller.fruits.length,
                  itemBuilder: (context, index) {
                    final fruit = controller.fruits.reversed.elementAt(index);
                    return CustomFruitListTile(
                      fruitRx: Rx<Fruit>(fruit),
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
