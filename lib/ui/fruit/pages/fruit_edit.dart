import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';

class FruitEdit extends StatelessWidget {
  FruitEdit({Key? key}) : super(key: key);
  final Rx<Fruit> _fruitRx = Get.arguments;
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
                  "Edit fruit",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomFruitForm(fruitRx: _fruitRx),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
