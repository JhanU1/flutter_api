import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';

// ignore: must_be_immutable
class FruitDetailsWidget extends StatelessWidget {
  FruitDetailsWidget({Key? key}) : super(key: key) {
    fruitController = Get.find();
    fruit = fruitController.selectedFruit;
  }
  late FruitController fruitController;
  late Rx<Fruit> fruit;
  @override
  Widget build(BuildContext context) {
    if (fruit.value.name.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Name"),
            Text(fruit.value.name),
            const Text("Genus"),
            Text(fruit.value.genus),
            const Text("Family"),
            Text(fruit.value.family),
            const Divider(),
            const Text("Nutritions"),
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const Text('Carbohydrates'),
                    Text(fruit.value.nutritions["carbohydrates"].toString()),
                    const Text('Protein'),
                    Text(fruit.value.nutritions["protein"].toString()),
                    const Text('Fat'),
                    Text(fruit.value.nutritions["fat"].toString()),
                    const Text('Calories'),
                    Text(fruit.value.nutritions["calories"].toString()),
                    const Text('Sugar'),
                    Text(fruit.value.nutritions["sugar"].toString()),
                  ],
                )),
          ],
        ),
      );
    } else {
      return const Center(child: Text('No fruit selected'));
    }
  }
}
