import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';

import '../widgets/fruit_edit.dart';

class FruitEditPage extends StatelessWidget {
  const FruitEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBarBack().build(context), body: FruitEditWidget());
  }
}
