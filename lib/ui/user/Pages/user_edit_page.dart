import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';

import '../widgets/user_edit.dart';

class UserEditPage extends StatelessWidget {
  /// Is a [StatelessWidget] that edit an user.
  /// 
  /// this widget use [Scaffold] and [UserEditWidget] to edit an user.
  /// [UserEditPage] constains all text fields to edit an user.
  const UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBarBack().build(context),
      body: UserEditWidget(),
    );
  }
}
