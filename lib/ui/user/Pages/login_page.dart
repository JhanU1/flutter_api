import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_buttom.dart';
import 'package:flutter_api/ui/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../../../domain/controllers/user_controller.dart';
import '../../widgets/custom_snackbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          child: Column(
        children: [
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
                    await _controller.login(
                        userName: _userNameController.text,
                        password: _passwordController.text);
                    Get.toNamed("/home");
                  } catch (e) {
                    showCustomSnackbar(
                      title: "Error",
                      message: e.toString(),
                    );
                  }
                }
              },
              typeMain: true)
        ],
      )),
    );
  }
}
