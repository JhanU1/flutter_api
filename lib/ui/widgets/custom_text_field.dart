import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controllers/responsive_controller.dart';

class WidgetTextField extends StatelessWidget {
  /// Is a [StatelessWidget] that show a text field.
  ///
  /// This widget use [TextFormField] to show a text field.
  /// [label] is a string that show a label.
  /// [obscure] is a boolean that show if the text field is obscure.
  /// [numbersOnly] is a boolean that indicate if the text field is only numbers.
  /// [validator] is the validator of the text field.
  /// [controller] is a [TextEditingController] that control the text field.
  /// [active] is a boolean that indicate if the text field is active.
  /// [maxLine] is a integer that indicate the max lines of the text field.
  /// [keyText] is a [Key] that indicate the key of the text field.

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

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool numbersOnly;
  final Key keyText;
  final int maxLine;
  final bool active;
  final ResponsiveController responsiveController = Get.find();

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
