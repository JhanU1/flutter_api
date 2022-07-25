import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/responsive_controller.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import '../widgets/fruit_details.dart';

class FruitDetailsPage extends StatelessWidget {
  FruitDetailsPage({Key? key}) : super(key: key);
  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Scaffold(
        appBar: WidgetAppBarBack().build(context),
        body: Column(
          children: [
            Text("Fruit Details", style: theme.textTheme.headline1),
            Expanded(
                child: ListView(
              controller: ScrollController(),
              children: [
                FruitDetailsWidget(),
              ],
            )),
          ],
        ));
  }
}
