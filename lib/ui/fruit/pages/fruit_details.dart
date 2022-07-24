import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';

// ignore: must_be_immutable
class FruitDetails extends StatelessWidget {
  FruitDetails({Key? key}) : super(key: key) {
    fruitController = Get.find();
    fruit = fruitController.selectedFruit.value;
  }
  late FruitController fruitController;
  late Fruit fruit;
  @override
  Widget build(BuildContext context) {
    if (fruit.name.isNotEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Name"),
              Text(fruit.name),
              const Text("Genus"),
              Text(fruit.genus),
              const Text("Family"),
              Text(fruit.family),
              const Divider(),
              const Text("Nutritions"),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      const Text('Carbohydrates'),
                      Text(fruit.nutritions["carbohydrates"].toString()),
                      const Text('Protein'),
                      Text(fruit.nutritions["protein"].toString()),
                      const Text('Fat'),
                      Text(fruit.nutritions["fat"].toString()),
                      const Text('Calories'),
                      Text(fruit.nutritions["calories"].toString()),
                      const Text('Sugar'),
                      Text(fruit.nutritions["sugar"].toString()),
                    ],
                  )),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(body: Center(child: Text('No fruit selected')));
    }
  }
}
