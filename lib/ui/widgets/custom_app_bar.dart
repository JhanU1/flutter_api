import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetAppBarBack {
  final String? title;
  final List<Widget>? actions;

  /// Buil a [AppBar] with a back button.
  ///
  /// This widget use [AppBar] and [BackButton] to show the back button.
  WidgetAppBarBack({this.title, this.actions});

  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          key: const Key("backBtn"),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      backgroundColor: const Color.fromARGB(255, 251, 207, 150),
      elevation: 0,
      actions: actions,
    );
  }
}
