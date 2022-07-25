import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  final themeData = ThemeData.light();
  bool isMobile = true;

  getThemeByDevice() {
    const Color primaryColor = Color.fromARGB(255, 251, 207, 150);
    const Color secondaryColor = Color.fromARGB(255, 136, 135, 130);
    const Color thirdColor = Color.fromARGB(255, 155, 155, 155);
    if (isMobile) {
      const TextStyle defaultTextStyle = TextStyle(
        color: Colors.black,
        fontSize: 16,
      );
      final textTheme = themeData.textTheme.copyWith(
        headline1: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 87, 83, 83),
        ),
        headline2: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        headline3: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        subtitle1: const TextStyle(
          fontSize: 16,
          color: thirdColor,
        ),
        subtitle2: defaultTextStyle,
        bodyText1: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 87, 83, 83),
        ),
      );
      return themeData.copyWith(
          textTheme: textTheme,
          primaryTextTheme: textTheme,
          primaryColor: primaryColor,
          primaryColorLight: primaryColor,
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 251, 207, 150)),
          ));
    } else {
      const TextStyle defaultTextStyle = TextStyle(
        color: Colors.black,
        fontSize: 16,
      );
      final textTheme = themeData.textTheme.copyWith(
        headline1: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 87, 83, 83),
        ),
        headline2: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        headline3: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: secondaryColor,
        ),
        subtitle1: const TextStyle(
          fontSize: 16,
          color: thirdColor,
        ),
        subtitle2: defaultTextStyle,
        bodyText1: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 87, 83, 83),
        ),
      );
      return themeData.copyWith(
          textTheme: textTheme,
          primaryTextTheme: textTheme,
          primaryColor: primaryColor,
          primaryColorLight: primaryColor,
          appBarTheme: const AppBarTheme(
            color: primaryColor,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 251, 207, 150)),
          ));
    }
  }
}
