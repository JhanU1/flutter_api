import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/responsive_controller.dart';
import '../widgets/custom_user_form.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final ResponsiveController responsiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Scaffold(
      appBar: WidgetAppBarBack().build(context),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: theme.textTheme.headline1,
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                children: [
                  UserForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
