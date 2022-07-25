import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../domain/controllers/responsive_controller.dart';
import 'fruit_user_page_phone.dart';
import 'fruit_user_page_tablet.dart';

class ResponsiveFruitUserPage extends GetResponsiveView<ResponsiveController> {
  ResponsiveFruitUserPage({Key? key}) : super(key: key);

  @override
  Widget builder() =>
      screen.isPhone ? const FruitUserPagePhone() : FruitUserPageTablet();
}
