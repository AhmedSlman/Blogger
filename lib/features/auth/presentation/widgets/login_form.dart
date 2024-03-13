import 'package:flutter/material.dart';

import 'auth_gradient_button.dart';
import 'auth_text_form_field.dart';

class LogInFormWidget extends StatefulWidget {
  const LogInFormWidget({super.key});

  @override
  State<LogInFormWidget> createState() => _LogInFormWidgetState();
}

class _LogInFormWidgetState extends State<LogInFormWidget> {
  final emailController = TextEditingController();
  final passwprdController = TextEditingController();
  final GlobalKey<FormState> logInFormKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwprdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: logInFormKey,
      child: Column(
        children: [
          const SizedBox(height: 15),
          AuthTextFormField(
            hintText: "Email",
            controller: emailController,
          ),
          const SizedBox(height: 15),
          AuthTextFormField(
            hintText: "Password",
            controller: passwprdController,
            isOscureText: true,
          ),
          const SizedBox(height: 15),
          AuthGradientButton(
            text: "Sign In",
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
