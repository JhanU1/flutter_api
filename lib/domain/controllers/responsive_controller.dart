import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  final themeData = ThemeData.light();

  selectThemeByDevice(isPhone) {
    if (isPhone) {
      const Color primaryColor = Color.fromARGB(255, 244, 204, 144);
      const Color secondaryColor = Color.fromARGB(255, 92, 91, 91);
      const Color thirdColor = Color.fromARGB(255, 151, 149, 149);
      const TextStyle defaultTextStyle = TextStyle(
        color: Colors.black,
        fontSize: 16,
      );

      final textTheme = themeData.textTheme.copyWith(
        headline1: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        headline2: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        headline3: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        headline4: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        headline5: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        headline6: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: thirdColor,
        ),
        subtitle1: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: thirdColor,
        ),
        subtitle2: defaultTextStyle,
        bodyText1: defaultTextStyle,
        bodyText2: defaultTextStyle,
        caption: defaultTextStyle,
        button: defaultTextStyle,
        overline: defaultTextStyle,
      );
      return themeData.copyWith(
        textTheme: textTheme,
        primaryTextTheme: textTheme,
      );
    }
  }
}
