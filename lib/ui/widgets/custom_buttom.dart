import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetButton extends StatelessWidget {
  /// Is a [StatelessWidget] that show a button.
  ///
  /// This widget use [ElevatedButton] to show a button.
  ///
  /// [text] is the text of the button.
  /// [onPressed] is the function that will be executed when the button is pressed.
  /// [typeMain] is a boolean that indicate if the button is main or not.
  /// [keyButton] is the key of the button.
  WidgetButton(
      {required this.text,
      required this.onPressed,
      required this.typeMain,
      this.keyButton = const Key(""),
      Key? key})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool typeMain;
  final Key keyButton;
  final RxBool loading = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 47,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            key: keyButton,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              )),
              backgroundColor: MaterialStateProperty.all<Color>(typeMain
                  ? Color.fromRGBO(42, 157, 143, loading.value ? 0.6 : 1)
                  : Color.fromRGBO(233, 196, 106, loading.value ? 0.6 : 1)),
            ),
            onPressed: () {
              if (loading.value) {
                return;
              }
              loading.value = true;
              onPressed();
              Future.delayed(const Duration(seconds: 1), () {
                loading.value = false;
              });
            },
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
