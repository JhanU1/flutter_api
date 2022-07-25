import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';

import 'package:get/get.dart';

import '../../../../data/models/fruit_model.dart';
import '../../../domain/controllers/user_controller.dart';

class CustomFruitListTile extends StatelessWidget {
  final Rx<Fruit> fruitRx;
  final FruitController fruitController = Get.find();
  final UserController userController = Get.find();
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  CustomFruitListTile({
    Key? key,
    required this.fruitRx,
    this.onTap,
    this.onEdit,
    this.onDelete,
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
                    onTap: onEdit,
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
                    onTap: onDelete,
                    child: Row(
                      children: const [
                        Icon(Icons.delete),
                        SizedBox(width: 2),
                        Text("Delete")
                      ],
                    ),
                  ),
                ];
              },
            ),
            onTap: onTap,
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
            onTap: onTap,
          );
  }
}
