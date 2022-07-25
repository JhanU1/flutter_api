import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';

// ignore: must_be_immutable
class FruitEditWidget extends StatelessWidget {
  FruitEditWidget({Key? key}) : super(key: key) {
    fruitController = Get.find();
    _fruitRx = fruitController.selectedFruit;
  }
  late FruitController fruitController;
  late Rx<Fruit>? _fruitRx;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
      //width: MediaQuery.of(context).size.width,
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
              scrollDirection: Axis.vertical,
              children: [
                CustomFruitForm(fruitRx: _fruitRx!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
