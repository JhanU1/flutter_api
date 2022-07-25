import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:flutter_api/domain/controllers/responsive_controller.dart';

import 'package:get/get.dart';

import '../../../../data/models/fruit_model.dart';
import '../../../domain/controllers/user_controller.dart';

class CustomFruitListTile extends StatelessWidget {
  /// Is a basic list tile to show a fruit.
  ///
  /// It uses the [fruitRx] to fill the list tile.
  /// [fruitRx] is a observable [Fruit].
  /// [onTap] is a callback used to show fruit details.
  /// [onEdit] is a callback used to edit fruit.
  /// [onDelete] is a callback used to delete fruit.
  CustomFruitListTile({
    Key? key,
    required this.fruitRx,
    this.onTap,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final Rx<Fruit> fruitRx;
  final FruitController fruitController = Get.find();
  final UserController userController = Get.find();
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsiveController = Get.find();
    final theme = responsiveController.getThemeByDevice();
    return fruitRx.value.createdBy == userController.user!.userName
        ? ListTile(
            title: Text(fruitRx.value.name, style: theme.textTheme.headline3),
            subtitle: Text("Family: ${fruitRx.value.family}",
                style: theme.textTheme.subtitle1),
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
            title: Text(fruitRx.value.name, style: theme.textTheme.headline3),
            subtitle: Text("Family: ${fruitRx.value.family}",
                style: theme.textTheme.subtitle1),
            onTap: onTap,
          );
  }
}
