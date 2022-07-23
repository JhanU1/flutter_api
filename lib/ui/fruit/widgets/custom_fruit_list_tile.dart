import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:get/get.dart';

import '../../../../data/models/fruit_model.dart';
import '../../widgets/custom_snackbar.dart';

class CustomFruitListTile extends StatelessWidget {
  final Rx<Fruit> fruitRx;
  final FruitController fruitController = Get.find();

  CustomFruitListTile({
    Key? key,
    required this.fruitRx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fruitRx.value.name),
      subtitle: Column(
        children: [
          Text(fruitRx.value.genus),
          Text(fruitRx.value.family),
        ],
      ),
      isThreeLine: true,
      leading: PopupMenuButton<Widget>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Get.toNamed('/edit_fruit', arguments: fruitRx);
                },
              ),
              child: const Text('Edit'),
            ),
            PopupMenuItem(
              value: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await fruitController.deleteFruit(fruitRx.value.name);
                    Get.back();
                    showCustomSnackbar(
                      title: 'Fruit deleted',
                      message: 'Fruit deleted successfully',
                    );
                  } catch (e) {
                    showCustomSnackbar(
                      title: 'Error',
                      message: e.toString(),
                    );
                  }
                },
              ),
              child: const Text('Delete'),
            ),
          ];
        },
      ),
      onTap: () {
        Get.toNamed('/details_fruit', arguments: fruitRx.value);
      },
    );
  }
}
