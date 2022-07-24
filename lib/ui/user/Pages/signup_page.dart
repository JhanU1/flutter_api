import 'package:flutter/material.dart';

import '../widgets/custom_user_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "Sign Up Page",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  UserForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
