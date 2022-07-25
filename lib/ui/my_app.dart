import 'package:flutter/material.dart';

import 'package:flutterapi/domain/controllers/user_controller.dart';
import 'package:flutterapi/ui/home/home_page.dart';
import 'package:get/get.dart';

import 'home/presentation_page.dart';

// En esta página se crea la lógica de la barra de navegación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation',
      home: GetX<UserController>(
        builder: (controller) {
          if (controller.user == null) {
            return PresentationPage();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
