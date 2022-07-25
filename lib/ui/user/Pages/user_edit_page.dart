import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';

import '../widgets/user_edit.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBarBack().build(context),
      body: UserEditWidget(),
    );
  }
}
