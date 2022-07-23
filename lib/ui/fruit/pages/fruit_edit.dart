import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';

class FruitCreate extends StatelessWidget {
  FruitCreate({Key? key}) : super(key: key);
  final Rx<Fruit> _fruitRx = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Fruit Edit"),
        CustomFruitForm(fruitRx: _fruitRx),
      ],
    );
  }
}
