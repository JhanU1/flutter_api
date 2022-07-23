import 'package:flutter/material.dart';

import '../widgets/custom_user_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Edit User Page"),
          UserForm(),
        ],
      ),
    );
  }
}
