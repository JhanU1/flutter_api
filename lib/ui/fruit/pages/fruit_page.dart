import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/fruit_model.dart';
import '../../../domain/controllers/fruit_controller.dart';
import '../widgets/custom_fruit_list_tile.dart';

class FruitPage extends StatelessWidget {
  FruitPage({Key? key}) : super(key: key);
  final FruitController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Fruit Page"),
          Expanded(child: ListView.builder(
            itemBuilder: ((context, index) {
              return CustomFruitListTile(
                  fruitRx: Rx<Fruit>(_controller.fruits[index]));
            }),
          ))
        ],
      ),
    );
  }
}
