import 'package:flutter/material.dart';
import 'package:flutter_api/ui/fruit/pages/responsive/fruit_page_phone.dart';
import 'package:flutter_api/ui/fruit/pages/responsive/fruit_page_tablet.dart';
import 'package:get/get.dart';

import '../../../../domain/controllers/responsive_controller.dart';

class ResponsiveViewCases1 extends GetResponsiveView<ResponsiveController> {
  ResponsiveViewCases1({Key? key}) : super(key: key);

  @override
  Widget builder() =>
      screen.isPhone ? const FruitPagePhone() : FruitPageTablet();
}
