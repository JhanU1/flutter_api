import 'package:flutter/material.dart';

import '../widgets/custom_user_form.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Text("Edit User Page"),
              UserForm(),
            ],
          ),
        ),
      ),
    );
  }
}
