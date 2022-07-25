import 'package:flutter/material.dart';
import 'package:flutter_api/ui/widgets/custom_app_bar.dart';

import '../widgets/fruit_create.dart';

class FruitCreatePage extends StatelessWidget {
  const FruitCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBarBack().build(context), body: FruitCreateWidget());
  }
}
