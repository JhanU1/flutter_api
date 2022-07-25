import 'package:flutter/material.dart';
import 'package:flutterapi/ui/fruit/pages/responsive/fruits/fruit_page_phone.dart';
import 'package:flutterapi/ui/fruit/pages/responsive/fruits/fruit_page_tablet.dart';
import 'package:get/get.dart';

import '../../../../../domain/controllers/responsive_controller.dart';

class ResponsiveFruitPage extends GetResponsiveView<ResponsiveController> {
  /// Is a [GetResponsiveView] that show fruit page in phone and tablet.
  ///
  /// If the device is tablet, this widget use [FruitPageTablet] to show the list of fruits.
  /// If the device is phone, this widget use [FruitPagePhone] to show the list of fruits.
  ResponsiveFruitPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    controller.isMobile = screen.isPhone;
    return screen.isPhone ? FruitPagePhone() : FruitPageTablet();
  }
}
