import 'package:flutter/material.dart';
import 'package:flutterapi/domain/controllers/responsive_controller.dart';
import 'package:flutterapi/ui/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import '../widgets/fruit_details.dart';

class FruitDetailsPage extends StatelessWidget {
  /// Is a [StatelessWidget] that create or edit a fruit.
  ///
  /// This widget use [Scaffold] and [FruitDetailsWidget] to show the details of a fruit.
  FruitDetailsPage({Key? key, this.fromPage = "fruit_user"}) : super(key: key);
  final ResponsiveController responsiveController = Get.find();
  String fromPage;
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
                FruitDetailsWidget(fromPage: fromPage),
              ],
            )),
          ],
        ));
  }
}
