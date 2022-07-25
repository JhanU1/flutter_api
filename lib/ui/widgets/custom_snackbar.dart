import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [CustomSnackbar] is a type of [SnackBar] that show a message in the bottom of the screen.
enum CustomSnackbarType { success, error, info }

/// Select icon for [CustomSnackbarType]
///
/// [CustomSnackbarType.success] returns [Icons.check]
/// [CustomSnackbarType.error] returns [Icons.error]
/// [CustomSnackbarType.info] returns [Icons.info]
Icon getIcon(CustomSnackbarType type) {
  switch (type) {
    case CustomSnackbarType.success:
      return Icon(
        Icons.check_circle,
        color: Colors.green[700],
        size: 30,
      );
    case CustomSnackbarType.error:
      return Icon(
        Icons.error,
        color: Colors.red[700],
        size: 30,
      );
    case CustomSnackbarType.info:
      return Icon(
        Icons.info,
        color: Colors.blue[700],
        size: 30,
      );
    default:
      return Icon(
        Icons.info,
        color: Colors.blue[700],
        size: 30,
      );
  }
}

/// show a [SnackBar] with a tite and message in the top of the screen.
///
/// [title] is the title of the [SnackBar]
/// [message] is the message of the [SnackBar]
/// [type] is the type of the [SnackBar]
/// [duration] is the duration of the [SnackBar]
/// [showProgressIndicator] is a boolean that show a progress indicator
void showCustomSnackbar(
    {required String title,
    required String message,
    CustomSnackbarType type = CustomSnackbarType.success,
    Duration? duration = const Duration(seconds: 3),
    bool? showProgressIndicator}) {
  Get.snackbar(
    title,
    message,
    shouldIconPulse: false,
    icon: getIcon(type),
    backgroundColor: Colors.grey[200],
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 16,
    ),
    snackStyle: SnackStyle.FLOATING,
    isDismissible: true,
    borderColor: const Color.fromRGBO(0, 0, 0, 0.15),
    borderWidth: 0.5,
    boxShadows: [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        offset: Offset(0, 1),
        blurRadius: 4,
        spreadRadius: 0,
      )
    ],
    duration: duration,
    showProgressIndicator: showProgressIndicator,
  );
}
