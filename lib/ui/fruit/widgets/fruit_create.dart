import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/widgets/custom_fruit_form.dart';

class FruitCreateWidget extends StatelessWidget {
  const FruitCreateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            child: Center(
              child: Text(
                "Create new fruit",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
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
