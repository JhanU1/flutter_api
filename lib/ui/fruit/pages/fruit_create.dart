import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';

class FruitCreate extends StatelessWidget {
  const FruitCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Fruit Create"),
        CustomFruitForm(),
      ],
    );
  }
}
