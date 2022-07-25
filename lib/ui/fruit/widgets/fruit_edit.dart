import 'package:flutter/material.dart';
import 'package:flutterapi/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../../../domain/controllers/responsive_controller.dart';

// ignore: must_be_immutable
class FruitEditWidget extends StatelessWidget {
  /// Is a [StatelessWidget] that edit a fruit.
  ///
  /// This widget use an observable [Fruit] to fill the details.
  /// [fromPage] is the page where the fruit is shown.
  /// [fruit] is taken from the [FruitController] depending on [fromPage]
  /// If [fromPage] is [fruit_user_page] the fruit is taken from [fruitController.selectedFruitUser]
  /// If [fromPage] is [fruit_page] the fruit is taken from [fruitController.selectedFruit]
  FruitEditWidget({Key? key, this.fromPage = "fruit_page"}) : super(key: key) {
    fruitController = Get.find();
    if (fromPage == "fruit_user_page") {
      _fruitRx = fruitController.selectedFruitUser;
    } else {
      _fruitRx = fruitController.selectedFruit;
    }
  }
  late FruitController fruitController;
  late Rx<Fruit>? _fruitRx;
  String fromPage;
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
              controller: ScrollController(),
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
