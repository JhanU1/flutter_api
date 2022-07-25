import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/responsive_controller.dart';

class FruitCreateWidget extends StatelessWidget {
  FruitCreateWidget({Key? key}) : super(key: key);
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
            "Create new fruit",
            style: theme.textTheme.headline1,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CustomFruitForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
