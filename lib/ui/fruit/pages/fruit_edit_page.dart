import 'package:flutter/material.dart';
import 'package:flutterapi/ui/widgets/custom_app_bar.dart';

import '../widgets/fruit_edit.dart';

class FruitEditPage extends StatelessWidget {
  /// Is a [StatelessWidget] that create or edit a fruit.
  ///
  /// This widget use [Scaffold] and [FruitEditWidget] to edit a fruit.
  FruitEditPage({Key? key, this.fromPage = "fruit_page"}) : super(key: key);
  String fromPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBarBack().build(context),
        body: FruitEditWidget(
          fromPage: fromPage,
        ));
  }
}
