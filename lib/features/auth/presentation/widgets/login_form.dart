import 'package:blogger/core/functions/show_snackbar.dart';
import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showSnackBar(context, "Welcomeeeeeeeeeeeeeeeeeeeeee");
        } else if (state is AuthFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
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
              state is AuthLoading
                  ? const LoaderWidget()
                  : AuthGradientButton(
                      text: "Sign In",
                      onTap: () {
                        if (logInFormKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  email: emailController.text.trim(),
                                  password: passwprdController.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
