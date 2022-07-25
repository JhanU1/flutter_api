import 'package:flutter/material.dart';
import 'package:flutter_api/domain/controllers/fruit_controller.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';

import 'package:flutter_api/ui/widgets/custom_buttom.dart';
import 'package:flutter_api/ui/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/responsive_controller.dart';
import '../../../domain/controllers/user_controller.dart';
import '../../home/home_page.dart';
import '../../widgets/custom_snackbar.dart';

class LoginPage extends StatelessWidget {
  /// Is a [StatelessWidget] that login an user.
  ///
  /// this widget use [UserController] to login an user.
  /// [LoginPage] constains all text fields to login an user.
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = Get.find<UserController>();
  final ResponsiveController responsiveController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Scaffold(
      appBar: WidgetAppBarBack().build(context),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: theme.textTheme.headline1,
              ),
              const SizedBox(height: 30),
              WidgetTextField(
                  label: "UserName",
                  controller: _userNameController,
                  validator: (value) {
                    if (value!.isEmpty) return "UserName is required";
                    return null;
                  }),
              WidgetTextField(
                  label: "Password",
                  controller: _passwordController,
                  obscure: true,
                  validator: (value) {
                    if (value!.isEmpty) return "Password is required";
                    return null;
                  }),
              WidgetButton(
                  text: "Login",
                  onPressed: () async {
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      try {
                        final FruitController fruitController = Get.find();
                        await _controller.login(
                            userName: _userNameController.text,
                            password: _passwordController.text);
                        fruitController.getAllFruit();
                        Get.off(() => HomePage());
                      } catch (e) {
                        showCustomSnackbar(
                          title: "Error",
                          message: e.toString(),
                          type: CustomSnackbarType.error,
                        );
                      }
                    }
                  },
                  typeMain: true)
            ],
          ),
        ),
      ),
    );
  }
}
