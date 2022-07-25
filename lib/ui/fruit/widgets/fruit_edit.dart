import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../../../domain/controllers/responsive_controller.dart';

// ignore: must_be_immutable
class FruitEditWidget extends StatelessWidget {
  FruitEditWidget({Key? key}) : super(key: key) {
    fruitController = Get.find();
    _fruitRx = fruitController.selectedFruit;
  }
  late FruitController fruitController;
  late Rx<Fruit>? _fruitRx;
  final ResponsiveController responsiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Edit fruit",
            style: theme.textTheme.headline1,
          ),
          const SizedBox(height: 30),
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
