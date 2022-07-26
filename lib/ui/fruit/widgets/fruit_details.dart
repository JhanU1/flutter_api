import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../../../domain/controllers/responsive_controller.dart';

// ignore: must_be_immutable
class FruitDetailsWidget extends StatelessWidget {
  /// Is a [StatelessWidget] that show the details of a fruit.
  ///
  /// This widget use an observable [Fruit] to fill the details.
  /// [fromPage] is the page where the fruit is shown.
  /// [fruit] is taken from the [FruitController] depending on [fromPage]
  /// If [fromPage] is [fruit_user_page] the fruit is taken from [fruitController.selectedFruitUser]
  /// If [fromPage] is [fruit_page] the fruit is taken from [fruitController.selectedFruit]
  FruitDetailsWidget({Key? key, this.fromPage = "fruit_page"})
      : super(key: key) {
    fruitController = Get.find();
  }
  late FruitController fruitController;
  late Rx<Fruit> fruit;
  final ResponsiveController responsiveController = Get.find();
  String fromPage;
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    final nutritionsStyle = theme.textTheme.bodyText1;
    return Obx(() {
      if (fromPage == "fruit_user_page") {
        fruit = fruitController.selectedFruitUser;
      } else {
        fruit = fruitController.selectedFruit;
      }
      if (fruit.value.name.isNotEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Name", style: theme.textTheme.headline2),
                Text(fruit.value.name, style: theme.textTheme.headline3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Genus", style: theme.textTheme.headline2),
                Text(fruit.value.genus, style: theme.textTheme.headline3),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Family", style: theme.textTheme.headline2),
                Text(fruit.value.family, style: theme.textTheme.headline3),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nutritions", style: theme.textTheme.headline2),
                  ],
                ),
                const SizedBox(height: 10),
                Text('Carbohydrates', style: theme.textTheme.headline3),
                const SizedBox(height: 10),
                Text(fruit.value.nutritions["carbohydrates"].toString(),
                    style: nutritionsStyle),
                const SizedBox(height: 10),
                Text('Protein', style: theme.textTheme.headline3),
                const SizedBox(height: 10),
                Text(fruit.value.nutritions["protein"].toString(),
                    style: nutritionsStyle),
                const SizedBox(height: 10),
                Text('Fat', style: theme.textTheme.headline3),
                const SizedBox(height: 10),
                Text(fruit.value.nutritions["fat"].toString(),
                    style: nutritionsStyle),
                const SizedBox(height: 10),
                Text('Calories', style: theme.textTheme.headline3),
                const SizedBox(height: 10),
                Text(fruit.value.nutritions["calories"].toString(),
                    style: nutritionsStyle),
                const SizedBox(height: 10),
                Text('Sugar', style: theme.textTheme.headline3),
                const SizedBox(height: 10),
                Text(fruit.value.nutritions["sugar"].toString(),
                    style: nutritionsStyle),
              ],
            ),
          ],
        );
      } else {
        return const Center(child: Text('No fruit selected'));
      }
    });
  }
}
