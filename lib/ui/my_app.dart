import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/user_controller.dart';
import 'package:flutter_api/ui/home/home_page.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: GetX<UserController>(
        builder: (controller) {
          if (controller.user == null) {
            return const PresentationPage();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
