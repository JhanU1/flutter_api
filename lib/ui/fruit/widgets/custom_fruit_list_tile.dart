import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:flutter_api/ui/fruit/pages/fruit_details.dart';
import 'package:flutter_api/ui/fruit/pages/fruit_edit.dart';
import 'package:get/get.dart';

import '../../../../data/models/fruit_model.dart';
import '../../../domain/controllers/user_controller.dart';
import '../../widgets/custom_snackbar.dart';

class CustomFruitListTile extends StatelessWidget {
  final Rx<Fruit> fruitRx;
  final FruitController fruitController = Get.find();
  final UserController userController = Get.find();

  CustomFruitListTile({
    Key? key,
    required this.fruitRx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fruitRx.value.createdBy == userController.user!.userName
        ? ListTile(
            title: Text(fruitRx.value.name),
            subtitle: Column(
              children: [
                Text(fruitRx.value.genus),
                Text(fruitRx.value.family),
              ],
            ),
            isThreeLine: true,
            trailing: PopupMenuButton<Widget>(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () async {
                      Future.delayed(const Duration(milliseconds: 500),
                          () => Get.to(() => FruitEdit(), arguments: fruitRx));
                      // await Get.to(() => FruitEdit(), arguments: fruitRx);
                    },
                    value: const Text('Edit'),
                    child: Row(
                      children: const [
                        Icon(Icons.edit),
                        SizedBox(width: 3),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: const Text('Delete'),
                    child: Row(
                      children: const [
                        Icon(Icons.delete),
                        SizedBox(width: 2),
                        Text("Delete")
                      ],
                    ),
                    onTap: () async {
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
                ];
              },
            ),
            onTap: () {
              Get.to(() => FruitDetails(), arguments: fruitRx.value);
            },
          )
        : ListTile(
            title: Text(fruitRx.value.name),
            subtitle: Column(
              children: [
                Text(fruitRx.value.genus),
                Text(fruitRx.value.family),
              ],
            ),
            isThreeLine: true,
            onTap: () {
              Get.to(() => FruitDetails(), arguments: fruitRx.value);
            },
          );
  }
}
