import 'package:flutter/material.dart';

class WidgetAppBarBack {
  final VoidCallback actionButtonBack;
  final String? title;
  final List<Widget>? actions;

  WidgetAppBarBack({required this.actionButtonBack, this.title, this.actions});

  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          key: const Key("backBtn"),
          color: Colors.black,
          onPressed: actionButtonBack,
          icon: const Icon(Icons.arrow_back)),
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      elevation: 0,
      actions: actions,
    );
  }
}
