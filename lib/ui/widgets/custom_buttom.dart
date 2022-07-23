import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool typeMain;
  final Key keyButton;
  final RxBool loading = RxBool(false);

  WidgetButton(
      {required this.text,
      required this.onPressed,
      required this.typeMain,
      this.keyButton = const Key("")})
      : super(key: keyButton);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: Container(
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
          ),
        ));
  }
}
