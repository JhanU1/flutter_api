import 'package:flutter/material.dart';
import 'package:flutterapi/ui/user/Pages/responsive/user_page_tablet.dart';
import 'package:get/get.dart';

import '../../../../domain/controllers/responsive_controller.dart';
import '../user_profile_page.dart';

class ResponsiveUserPage extends GetResponsiveView<ResponsiveController> {
  /// Is a [GetResponsiveView] that show user page in phone and tablet.
  ///
  /// If the device is tablet, this widget use [UserProfileTablet] to show the user page.
  /// If the device is phone, this widget use [UserProfilePage] to show the user page.
  ResponsiveUserPage({Key? key}) : super(key: key);

  @override
  Widget builder() => screen.isPhone ? UserProfilePage() : UserProfileTablet();
}
