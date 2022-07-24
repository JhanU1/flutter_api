import 'package:flutter/material.dart';
import 'package:flutter_api/ui/user/Pages/login_page.dart';
import 'package:get/get.dart';

import '../user/Pages/signup_page.dart';
import '../widgets/custom_buttom.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromRGBO(244, 244, 244, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Column(
              children: const [
                Icon(
                  Icons.grass,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  "Flutter API",
                )
              ],
            )),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Join the community or login to continue",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetButton(
                          text: "Registrate",
                          onPressed: () {
                            Get.to(() => const SignUpPage());
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
