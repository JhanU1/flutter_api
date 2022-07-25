import 'package:flutter/material.dart';
import 'package:flutter_api/ui/user/Pages/login_page.dart';
import 'package:get/get.dart';

import '../../domain/controllers/responsive_controller.dart';
import '../user/Pages/signup_page.dart';
import '../widgets/custom_buttom.dart';

class PresentationPage extends StatelessWidget {
  /// Is a [StatelessWidget] that show presentation page.
  ///
  /// This widget is the initial page of the app.
  PresentationPage({Key? key}) : super(key: key);
  final ResponsiveController responsiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: theme.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Column(
              children: [
                const Icon(
                  Icons.grass,
                  size: 100,
                  color: Colors.teal,
                ),
                Text(
                  "Flutter API",
                  style: theme.textTheme.headline1,
                )
              ],
            )),
            Center(
              child: Column(
                children: [
                  Text(
                    "Join the community or login to continue",
                    style: theme.textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetButton(
                          text: "Registrate",
                          onPressed: () {
                            Get.to(() => SignUpPage());
                          },
                          typeMain: false),
                      WidgetButton(
                          text: "Login",
                          onPressed: () {
                            Get.to(() => LoginPage());
                          },
                          typeMain: false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
