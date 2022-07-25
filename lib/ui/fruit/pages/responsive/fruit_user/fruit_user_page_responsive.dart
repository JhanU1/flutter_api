import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../domain/controllers/responsive_controller.dart';
import 'fruit_user_page_phone.dart';
import 'fruit_user_page_tablet.dart';

class ResponsiveFruitUserPage extends GetResponsiveView<ResponsiveController> {
  /// Is a [GetResponsiveView] that show user fruit page in phone and tablet.
  ///
  /// If the device is tablet, this widget use [FruitUserPageTablet] to show the list of fruits.
  /// If the device is phone, this widget use [FruitUserPagePhone] to show the list of fruits.
  ResponsiveFruitUserPage({Key? key}) : super(key: key);

  @override
  Widget builder() =>
      screen.isPhone ? FruitUserPagePhone() : FruitUserPageTablet();
}
