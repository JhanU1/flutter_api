import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controllers/responsive_controller.dart';

class WidgetTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool numbersOnly;
  final Key keyText;
  final int maxLine;
  final bool active;
  final ResponsiveController responsiveController = Get.find();

  WidgetTextField(
      {required this.label,
      required this.controller,
      this.validator,
      this.obscure = false,
      this.numbersOnly = false,
      this.active = true,
      this.maxLine = 1,
      this.keyText = const Key(""),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = responsiveController.getThemeByDevice();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: active,
        key: keyText,
        maxLines: maxLine,
        obscureText: obscure,
        keyboardType: numbersOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          labelText: label,
          labelStyle: theme.textTheme.headline3,
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
