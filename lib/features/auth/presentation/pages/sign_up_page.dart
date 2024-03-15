import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogger/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth_header_text.dart';
import '../widgets/have_an_acount.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const LoaderWidget();
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                customReplacementNavigate(context, RouterNames.loginPage);
              },
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthHeaderTextWidget(
                    text: 'Sign UP',
                  ),
                  const SizedBox(height: 25),
                  const SignUpFormWidget(),
                  HaveAnAcountWidget(
                    onTab: () {
                      customReplacementNavigate(context, RouterNames.loginPage);
                    },
                    text1: "Already have an account?  ",
                    text2: "Sign In",
                  ),
                ],
              )),
        );
      },
    );
  }
}
