import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_model.dart';
import '../../../../domain/controllers/user_controller.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text_field.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key, this.user}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final User? user;
  final _controller = Get.find<UserController>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _urlImageController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  onInit() {
    if (user != null) {
      _nameController.text = user!.name;
      _lastNameController.text = user!.lastName;
      _userNameController.text = user!.userName;
      _passwordController.text = user!.password;
      _emailController.text = user!.email;
      _urlImageController.text = user!.urlImage;
      _descriptionController.text = user!.description;
    }
  }

  handlerButton() async {
    if (user == null) {
      await _controller.register(
        name: _nameController.text,
        lastName: _lastNameController.text,
        userName: _userNameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        urlImage: _urlImageController.text,
        description: _descriptionController.text,
      );
      Get.back();
      showCustomSnackbar(
        title: 'User added',
        message: 'User added successfully',
      );
    } else {
      await _controller.updateUser(
        name: _nameController.text,
        lastName: _lastNameController.text,
        userName: _userNameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        urlImage: _urlImageController.text,
        description: _descriptionController.text,
      );
      Get.back();
      showCustomSnackbar(
        title: 'User updated',
        message: 'User updated successfully',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    onInit();
    return Form(
      key: _formKey,
      child: Column(children: [
        WidgetTextField(
            label: "Name",
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) return "Name is required";
              return null;
            }),
        WidgetTextField(
            label: "Last Name",
            controller: _lastNameController,
            validator: (value) {
              if (value!.isEmpty) return "Last Name is required";
              return null;
            }),
        WidgetTextField(
            active: user != null,
            label: "User Name",
            controller: _userNameController,
            validator: (value) {
              if (value!.isEmpty) return "User Name is required";
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
        WidgetTextField(
            label: "Confirm Password",
            controller: _confirmPasswordController,
            obscure: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Confirm Password is required";
              }
              if (value != _passwordController.text) {
                return "Password does not match";
              }
              return null;
            }),
        WidgetTextField(
            label: "Email",
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Email is required";
              } else if (GetUtils.isEmail(value) == false) {
                return "Email is not valid";
              }
              return null;
            }),
        WidgetTextField(
            label: "Url Image",
            controller: _urlImageController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Url Image is required";
              } else if (!GetUtils.isURL(value)) {
                return "Url Image is not valid";
              }
              return null;
            }),
        WidgetTextField(
            label: "Description",
            controller: _descriptionController,
            validator: (value) {
              if (value!.isEmpty) return "Description is required";
              return null;
            }),
        WidgetButton(
            text: "Save",
            onPressed: () async {
              final form = _formKey.currentState;
              form!.save();
              if (form.validate()) {
                try {
                  await handlerButton();
                } catch (e) {
                  showCustomSnackbar(title: "Error", message: e.toString());
                }
              }
            },
            typeMain: true)
      ]),
    );
  }
}
