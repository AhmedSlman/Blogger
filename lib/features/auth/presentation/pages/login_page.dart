import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_header_text.dart';
import '../widgets/have_an_acount.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthHeaderTextWidget(
              text: 'Sign In.',
            ),
            const SizedBox(height: 25),
            const LogInFormWidget(),
            HaveAnAcountWidget(
              onTab: () {
                customReplacementNavigate(context, RouterNames.signUpPage);
              },
              text1: "Don't have an account?  ",
              text2: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
