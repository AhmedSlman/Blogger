import 'package:blogger/core/functions/show_snackbar.dart';
import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_gradient_button.dart';
import 'auth_text_form_field.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwprdController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwprdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: signUpFormKey,
          child: Column(
            children: [
              AuthTextFormField(
                hintText: "Name",
                controller: nameController,
              ),
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
                      text: 'Sign Up',
                      onTap: () {
                        if (signUpFormKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  name: nameController.text.trim(),
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
